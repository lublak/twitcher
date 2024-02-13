@tool
extends RefCounted

class_name TwitchGetChannelFollowersResponse

## The list of users that follow the specified broadcaster. The list is in descending order by `followed_at` (with the most recent follower first). The list is empty if nobody follows the broadcaster, the specified `user_id` isn’t in the follower list, the user access token is missing the **moderator:read:followers** scope, or the user isn’t the broadcaster or moderator for the channel.
var data: Array[Data];
## Contains the information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read more](https://dev.twitch.tv/docs/api/guide#pagination).
var pagination: Pagination;
## The total number of users that follow this broadcaster. As someone pages through the list, the number of users may change as users follow or unfollow the broadcaster.
var total: int;

static func from_json(d: Dictionary) -> TwitchGetChannelFollowersResponse:
	var result = TwitchGetChannelFollowersResponse.new();
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
	## The UTC timestamp when the user started following the broadcaster.
	var followed_at: Variant;
	## An ID that uniquely identifies the user that’s following the broadcaster.
	var user_id: String;
	## The user’s login name.
	var user_login: String;
	## The user’s display name.
	var user_name: String;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("followed_at") && d["followed_at"] != null:
			result.followed_at = d["followed_at"];
		if d.has("user_id") && d["user_id"] != null:
			result.user_id = d["user_id"];
		if d.has("user_login") && d["user_login"] != null:
			result.user_login = d["user_login"];
		if d.has("user_name") && d["user_name"] != null:
			result.user_name = d["user_name"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["followed_at"] = followed_at;
		d["user_id"] = user_id;
		d["user_login"] = user_login;
		d["user_name"] = user_name;
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

