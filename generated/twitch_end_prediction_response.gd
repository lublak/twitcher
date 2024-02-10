@tool
extends RefCounted

class_name TwitchEndPredictionResponse

## A list that contains the single prediction that you updated.
var data: Array[TwitchPrediction];

static func from_json(d: Dictionary) -> TwitchEndPredictionResponse:
	var result = TwitchEndPredictionResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchPrediction.from_json(value));
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
