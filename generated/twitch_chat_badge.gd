@tool
extends RefCounted

class_name TwitchChatBadge

## An ID that identifies this set of chat badges. For example, Bits or Subscriber.
var set_id: String;
## The list of chat badges in this set.
var versions: Array[Versions];

static func from_json(d: Dictionary) -> TwitchChatBadge:
	var result = TwitchChatBadge.new();
	if d.has("set_id") && d["set_id"] != null:
		result.set_id = d["set_id"];
	if d.has("versions") && d["versions"] != null:
		for value in d["versions"]:
			result.versions.append(Versions.from_json(value));
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["set_id"] = set_id;
	d["versions"] = [];
	if versions != null:
		for value in versions:
			d["versions"].append(value.to_dict());
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## 
class Versions extends RefCounted:
	## An ID that identifies this version of the badge. The ID can be any value. For example, for Bits, the ID is the Bits tier level, but for World of Warcraft, it could be Alliance or Horde.
	var id: String;
	## A URL to the small version (18px x 18px) of the badge.
	var image_url_1x: String;
	## A URL to the medium version (36px x 36px) of the badge.
	var image_url_2x: String;
	## A URL to the large version (72px x 72px) of the badge.
	var image_url_4x: String;
	## The title of the badge.
	var title: String;
	## The description of the badge.
	var description: String;
	## The action to take when clicking on the badge. Set to `null` if no action is specified.
	var click_action: String;
	## The URL to navigate to when clicking on the badge. Set to `null` if no URL is specified.
	var click_url: String;


	static func from_json(d: Dictionary) -> Versions:
		var result = Versions.new();
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		if d.has("image_url_1x") && d["image_url_1x"] != null:
			result.image_url_1x = d["image_url_1x"];
		if d.has("image_url_2x") && d["image_url_2x"] != null:
			result.image_url_2x = d["image_url_2x"];
		if d.has("image_url_4x") && d["image_url_4x"] != null:
			result.image_url_4x = d["image_url_4x"];
		if d.has("title") && d["title"] != null:
			result.title = d["title"];
		if d.has("description") && d["description"] != null:
			result.description = d["description"];
		if d.has("click_action") && d["click_action"] != null:
			result.click_action = d["click_action"];
		if d.has("click_url") && d["click_url"] != null:
			result.click_url = d["click_url"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["id"] = id;
		d["image_url_1x"] = image_url_1x;
		d["image_url_2x"] = image_url_2x;
		d["image_url_4x"] = image_url_4x;
		d["title"] = title;
		d["description"] = description;
		d["click_action"] = click_action;
		d["click_url"] = click_url;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

