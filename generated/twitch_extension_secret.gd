@tool
extends RefCounted

class_name TwitchExtensionSecret

## The version number that identifies this definition of the secret’s data.
var format_version: int;
## The list of secrets.
var secrets: Array[Secrets];

static func from_json(d: Dictionary) -> TwitchExtensionSecret:
	var result = TwitchExtensionSecret.new();
	if d.has("format_version") && d["format_version"] != null:
		result.format_version = d["format_version"];
	if d.has("secrets") && d["secrets"] != null:
		for value in d["secrets"]:
			result.secrets.append(Secrets.from_json(value));
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["format_version"] = format_version;
	d["secrets"] = [];
	if secrets != null:
		for value in secrets:
			d["secrets"].append(value.to_dict());
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## 
class Secrets extends RefCounted:
	## The raw secret that you use with JWT encoding.
	var content: String;
	## The UTC date and time (in RFC3339 format) that you may begin using this secret to sign a JWT.
	var active_at: Variant;
	## The UTC date and time (in RFC3339 format) that you must stop using this secret to decode a JWT.
	var expires_at: Variant;


	static func from_json(d: Dictionary) -> Secrets:
		var result = Secrets.new();
		if d.has("content") && d["content"] != null:
			result.content = d["content"];
		if d.has("active_at") && d["active_at"] != null:
			result.active_at = d["active_at"];
		if d.has("expires_at") && d["expires_at"] != null:
			result.expires_at = d["expires_at"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["content"] = content;
		d["active_at"] = active_at;
		d["expires_at"] = expires_at;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

