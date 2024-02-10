@tool
extends RefCounted

class_name TwitchUserExtension

## An ID that identifies the extension.
var id: String;
## The extension's version.
var version: String;
## The extension's name.
var name: String;
## A Boolean value that determines whether the extension is configured and can be activated. Is **true** if the extension is configured and can be activated.
var can_activate: bool;
## The extension types that you can activate for this extension. Possible values are:      * component * mobile * overlay * panel
var type: Array[String];

static func from_json(d: Dictionary) -> TwitchUserExtension:
	var result = TwitchUserExtension.new();
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	if d.has("version") && d["version"] != null:
		result.version = d["version"];
	if d.has("name") && d["name"] != null:
		result.name = d["name"];
	if d.has("can_activate") && d["can_activate"] != null:
		result.can_activate = d["can_activate"];
	if d.has("type") && d["type"] != null:
		for value in d["type"]:
			result.type.append(value);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["id"] = id;
	d["version"] = version;
	d["name"] = name;
	d["can_activate"] = can_activate;
	d["type"] = [];
	if type != null:
		for value in type:
			d["type"].append(value);
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
