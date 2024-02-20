@tool
extends RefCounted

class_name TwitchGetFollowedChannelsResponse

## The list of broadcasters that the user follows. The list is in descending order by `followed_at` (with the most recently followed broadcaster first). The list is empty if the user doesn’t follow anyone.
var data: Array[Data];
## Contains the information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read more](https://dev.twitch.tv/docs/api/guide#pagination).
var pagination: Pagination;
## The total number of broadcasters that the user follows. As someone pages through the list, the number may change as the user follows or unfollows broadcasters.
var total: int;

static func from_json(d: Dictionary) -> TwitchGetFollowedChannelsResponse:
	var result = TwitchGetFollowedChannelsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(Data.from_json(value));
	if d.has("pagination") && d["pagination"] != null:
		result.pagination = Pagination.from_json(d["pagination"]);
	if d.has("total") && d["total"] != null:
		result.total = d["total"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value.to_dict());
	if pagination != null:
		d["pagination"] = pagination.to_dict();
	d["total"] = total;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

##
class Data extends RefCounted:
	## An ID that uniquely identifies the broadcaster that this user is following.
	var broadcaster_id: String;
	## The broadcaster’s login name.
	var broadcaster_login: String;
	## The broadcaster’s display name.
	var broadcaster_name: String;
	## The UTC timestamp when the user started following the broadcaster.
	var followed_at: Variant;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("broadcaster_id") && d["broadcaster_id"] != null:
			result.broadcaster_id = d["broadcaster_id"];
		if d.has("broadcaster_login") && d["broadcaster_login"] != null:
			result.broadcaster_login = d["broadcaster_login"];
		if d.has("broadcaster_name") && d["broadcaster_name"] != null:
			result.broadcaster_name = d["broadcaster_name"];
		if d.has("followed_at") && d["followed_at"] != null:
			result.followed_at = d["followed_at"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["broadcaster_id"] = broadcaster_id;
		d["broadcaster_login"] = broadcaster_login;
		d["broadcaster_name"] = broadcaster_name;
		d["followed_at"] = followed_at;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## Contains the information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read more](https://dev.twitch.tv/docs/api/guide#pagination).
class Pagination extends RefCounted:
	## The cursor used to get the next page of results. Use the cursor to set the request’s _after_ query parameter.
	var cursor: String;


	static func from_json(d: Dictionary) -> Pagination:
		var result = Pagination.new();
		if d.has("cursor") && d["cursor"] != null:
			result.cursor = d["cursor"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["cursor"] = cursor;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

