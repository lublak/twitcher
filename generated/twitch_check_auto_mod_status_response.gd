@tool
extends RefCounted

class_name TwitchCheckAutoModStatusResponse

## The list of messages and whether Twitch would approve them for chat.
var data: Array[TwitchAutoModStatus];

static func from_json(d: Dictionary) -> TwitchCheckAutoModStatusResponse:
	var result = TwitchCheckAutoModStatusResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchAutoModStatus.from_json(value));
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
