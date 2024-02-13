@tool
extends RefCounted

class_name TwitchUpdateConduitShardsBody

## Conduit ID.
var conduit_id: String;
## List of shards to update.
var shards: Array[Shards];

static func from_json(d: Dictionary) -> TwitchUpdateConduitShardsBody:
	var result = TwitchUpdateConduitShardsBody.new();
	if d.has("conduit_id") && d["conduit_id"] != null:
		result.conduit_id = d["conduit_id"];
	if d.has("shards") && d["shards"] != null:
		for value in d["shards"]:
			result.shards.append(Shards.from_json(value));
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["conduit_id"] = conduit_id;
	d["shards"] = [];
	if shards != null:
		for value in shards:
			d["shards"].append(value.to_dict());
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## The transport details that you want Twitch to use when sending you notifications.
class Transport extends RefCounted:
	## The transport method. Possible values are:      * webhook * websocket
	var method: String;
	## The callback URL where the notifications are sent. The URL must use the HTTPS protocol and port 443\. See Processing an event.Specify this field only if method is set to webhook.NOTE: Redirects are not followed.
	var callback: String;
	## The secret used to verify the signature. The secret must be an ASCII string that’s a minimum of 10 characters long and a maximum of 100 characters long. For information about how the secret is used, see Verifying the event message.Specify this field only if method is set to webhook.
	var secret: String;
	## An ID that identifies the WebSocket to send notifications to. When you connect to EventSub using WebSockets, the server returns the ID in the Welcome message.Specify this field only if method is set to websocket.
	var session_id: String;


	static func from_json(d: Dictionary) -> Transport:
		var result = Transport.new();
		if d.has("method") && d["method"] != null:
			result.method = d["method"];
		if d.has("callback") && d["callback"] != null:
			result.callback = d["callback"];
		if d.has("secret") && d["secret"] != null:
			result.secret = d["secret"];
		if d.has("session_id") && d["session_id"] != null:
			result.session_id = d["session_id"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["method"] = method;
		d["callback"] = callback;
		d["secret"] = secret;
		d["session_id"] = session_id;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## 
class Shards extends RefCounted:
	## Shard ID.
	var id: String;
	## The transport details that you want Twitch to use when sending you notifications.
	var transport: Transport;


	static func from_json(d: Dictionary) -> Shards:
		var result = Shards.new();
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		if d.has("transport") && d["transport"] != null:
			result.transport = Transport.from_json(d["transport"]);
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["id"] = id;
		if transport != null:
			d["transport"] = transport.to_dict();
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

