@tool
extends RefCounted

class_name TwitchCheermoteImageTheme

## No description available
var animated_format: TwitchCheermoteImageFormat;
## No description available
var static_format: TwitchCheermoteImageFormat;

static func from_json(d: Dictionary) -> TwitchCheermoteImageTheme:
	var result = TwitchCheermoteImageTheme.new();
	if d.has("animated") && d["animated"] != null:
		result.animated_format = TwitchCheermoteImageFormat.from_json(d["animated"]);
	if d.has("static") && d["static"] != null:
		result.static_format = TwitchCheermoteImageFormat.from_json(d["static"]);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	if animated_format != null:
		d["animated"] = animated_format.to_dict();
	if static_format != null:
		d["static"] = static_format.to_dict();
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

