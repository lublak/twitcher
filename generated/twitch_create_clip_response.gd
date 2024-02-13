@tool
extends RefCounted

class_name TwitchCreateClipResponse

## 
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchCreateClipResponse:
	var result = TwitchCreateClipResponse.new();
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
	## A URL that you can use to edit the clip’s title, identify the part of the clip to publish, and publish the clip. [Learn More](https://help.twitch.tv/s/article/how-to-use-clips)      The URL is valid for up to 24 hours or until the clip is published, whichever comes first.
	var edit_url: String;
	## An ID that uniquely identifies the clip.
	var id: String;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("edit_url") && d["edit_url"] != null:
			result.edit_url = d["edit_url"];
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["edit_url"] = edit_url;
		d["id"] = id;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

