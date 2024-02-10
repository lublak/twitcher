@tool
extends RefCounted

class_name TwitchGetCustomRewardResponse

## A list of custom rewards. The list is in ascending order by `id`. If the broadcaster hasn’t created custom rewards, the list is empty.
var data: Array[TwitchCustomReward];

static func from_json(d: Dictionary) -> TwitchGetCustomRewardResponse:
	var result = TwitchGetCustomRewardResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchCustomReward.from_json(value));
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
