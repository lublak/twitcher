@tool
extends RefCounted

class_name TwitchUpdateShieldModeStatusResponse

## A list that contains a single object with the broadcaster’s updated Shield Mode status.
var data: Array;

static func from_json(d: Dictionary) -> TwitchUpdateShieldModeStatusResponse:
	var result = TwitchUpdateShieldModeStatusResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(value);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value);
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
