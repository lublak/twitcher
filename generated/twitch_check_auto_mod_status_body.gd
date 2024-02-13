@tool
extends RefCounted

class_name TwitchCheckAutoModStatusBody

## The list of messages to check. The list must contain at least one message and may contain up to a maximum of 100 messages.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchCheckAutoModStatusBody:
	var result = TwitchCheckAutoModStatusBody.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(Data.from_json(value));
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value.to_dict());
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## 
class Data extends RefCounted:
	## A caller-defined ID used to correlate this message with the same message in the response.
	var msg_id: String;
	## The message to check.
	var msg_text: String;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("msg_id") && d["msg_id"] != null:
			result.msg_id = d["msg_id"];
		if d.has("msg_text") && d["msg_text"] != null:
			result.msg_text = d["msg_text"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["msg_id"] = msg_id;
		d["msg_text"] = msg_text;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

