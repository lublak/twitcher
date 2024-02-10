@tool
extends RefCounted

class_name TwitchGetUsersResponse

## The list of users.
var data: Array[TwitchUser];

static func from_json(d: Dictionary) -> TwitchGetUsersResponse:
	var result = TwitchGetUsersResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchUser.from_json(value));
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
