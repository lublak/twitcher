@tool
extends RefCounted

class_name TwitchBanUserResponse

## A list that contains the user you successfully banned or put in a timeout.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchBanUserResponse:
	var result = TwitchBanUserResponse.new();
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
	## The broadcaster whose chat room the user was banned from chatting in.
	var broadcaster_id: String;
	## The moderator that banned or put the user in the timeout.
	var moderator_id: String;
	## The user that was banned or put in a timeout.
	var user_id: String;
	## The UTC date and time (in RFC3339 format) that the ban or timeout was placed.
	var created_at: Variant;
	## The UTC date and time (in RFC3339 format) that the timeout will end. Is **null** if the user was banned instead of being put in a timeout.
	var end_time: Variant;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("broadcaster_id") && d["broadcaster_id"] != null:
			result.broadcaster_id = d["broadcaster_id"];
		if d.has("moderator_id") && d["moderator_id"] != null:
			result.moderator_id = d["moderator_id"];
		if d.has("user_id") && d["user_id"] != null:
			result.user_id = d["user_id"];
		if d.has("created_at") && d["created_at"] != null:
			result.created_at = d["created_at"];
		if d.has("end_time") && d["end_time"] != null:
			result.end_time = d["end_time"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["broadcaster_id"] = broadcaster_id;
		d["moderator_id"] = moderator_id;
		d["user_id"] = user_id;
		d["created_at"] = created_at;
		d["end_time"] = end_time;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

