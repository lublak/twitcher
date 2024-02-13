@tool
extends RefCounted

class_name TwitchStartRaidResponse

## A list that contains a single object with information about the pending raid.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchStartRaidResponse:
	var result = TwitchStartRaidResponse.new();
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
	## The UTC date and time, in RFC3339 format, of when the raid was requested.
	var created_at: Variant;
	## A Boolean value that indicates whether the channel being raided contains mature content.
	var is_mature: bool;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("created_at") && d["created_at"] != null:
			result.created_at = d["created_at"];
		if d.has("is_mature") && d["is_mature"] != null:
			result.is_mature = d["is_mature"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["created_at"] = created_at;
		d["is_mature"] = is_mature;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

