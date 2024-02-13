@tool
extends RefCounted

class_name TwitchGetStreamKeyResponse

## A list that contains the channel’s stream key.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchGetStreamKeyResponse:
	var result = TwitchGetStreamKeyResponse.new();
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
	## The channel’s stream key.
	var stream_key: String;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("stream_key") && d["stream_key"] != null:
			result.stream_key = d["stream_key"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["stream_key"] = stream_key;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

