@tool
extends RefCounted

# CLASS GOT AUTOGENERATED DON'T CHANGE MANUALLY. CHANGES CAN BE OVERWRITTEN EASILY.

class_name TwitchUpdateConduitsResponse

## List of information about the client’s conduits.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchUpdateConduitsResponse:
	var result = TwitchUpdateConduitsResponse.new();
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
	## Conduit ID.
	var id: String;
	## Number of shards associated with this conduit after the update.
	var shard_count: int;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		if d.has("shard_count") && d["shard_count"] != null:
			result.shard_count = d["shard_count"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["id"] = id;
		d["shard_count"] = shard_count;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

