@tool
extends RefCounted

class_name TwitchExtensionLiveChannel

## The ID of the broadcaster that is streaming live and has installed or activated the extension.
var broadcaster_id: String;
## The broadcaster’s display name.
var broadcaster_name: String;
## The name of the category or game being streamed.
var game_name: String;
## The ID of the category or game being streamed.
var game_id: String;
## The title of the broadcaster’s stream. May be an empty string if not specified.
var title: String;

static func from_json(d: Dictionary) -> TwitchExtensionLiveChannel:
	var result = TwitchExtensionLiveChannel.new();
	if d.has("broadcaster_id") && d["broadcaster_id"] != null:
		result.broadcaster_id = d["broadcaster_id"];
	if d.has("broadcaster_name") && d["broadcaster_name"] != null:
		result.broadcaster_name = d["broadcaster_name"];
	if d.has("game_name") && d["game_name"] != null:
		result.game_name = d["game_name"];
	if d.has("game_id") && d["game_id"] != null:
		result.game_id = d["game_id"];
	if d.has("title") && d["title"] != null:
		result.title = d["title"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["broadcaster_id"] = broadcaster_id;
	d["broadcaster_name"] = broadcaster_name;
	d["game_name"] = game_name;
	d["game_id"] = game_id;
	d["title"] = title;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
