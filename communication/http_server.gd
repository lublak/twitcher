extends RefCounted

class_name HTTPServer

var server : TCPServer

class Client extends RefCounted:
	var peer: StreamPeerTCP;

var clients: Array[Client] = [];
var request_handler: Array[Callable] = [];
var listening_port: int;

func _init(port: int) -> void:
	server = TCPServer.new();
	listening_port = port;
	Engine.get_main_loop().process_frame.connect(poll);

func poll() -> void:
	if(!server.is_listening()): return;

	if(server.is_connection_available()):
		_handle_connect();

	for client in clients:
		_process_request(client);
		_handle_disconnect(client);

func start():
	print("HTTP: Start Server")
	if server.listen(listening_port) != OK:
		print("Could not listen to port %d" % listening_port);

func stop():
	print("HTTP: Stop Server")
	server.stop()

func _handle_connect() -> void:
	var peer := server.take_connection();
	var client := Client.new()
	client.peer = peer;
	clients.append(client);
	print("HTTP: Client connected")

func _process_request(client: Client) -> void:
	var peer := client.peer;
	if(peer.get_status() == StreamPeerTCP.STATUS_CONNECTED):
		var error = peer.poll();
		if(error != OK):
			printerr("Can't poll data: ", error_string(error))
		elif (peer.get_available_bytes() > 0):
			for handler in request_handler:
				handler.call(self, client);

func _handle_disconnect(client: Client) -> void:
	if(client.peer.get_status() != StreamPeerTCP.STATUS_CONNECTED):
		print("HTTP: Client disconnected")
		clients.erase(client);

func add_request_handler(handler: Callable) -> void:
	request_handler.append(handler);

func send_response(peer: StreamPeerTCP, response_code : String, body : PackedByteArray) -> void:
	peer.put_data(("HTTP/1.1 %s\r\n" % response_code).to_utf8_buffer())
	peer.put_data("Server: Godot Engine\r\n".to_utf8_buffer())
	peer.put_data(("Content-Length: %d\r\n"% body.size()).to_utf8_buffer())
	peer.put_data("Connection: close\r\n".to_utf8_buffer())
	peer.put_data("Content-Type: text/html; charset=UTF-8\r\n".to_utf8_buffer())
	peer.put_data("\r\n".to_utf8_buffer())
	peer.put_data(body)
