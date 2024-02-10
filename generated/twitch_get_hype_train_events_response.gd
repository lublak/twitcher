@tool
extends RefCounted

class_name TwitchGetHypeTrainEventsResponse

## The list of Hype Train events. The list is empty if the broadcaster hasn’t run a Hype Train within the last 5 days.
var data: Array[TwitchHypeTrainEvent];
## Contains the information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read More](https://dev.twitch.tv/docs/api/guide#pagination)
var pagination: GetHypeTrainEventsResponsePagination;

static func from_json(d: Dictionary) -> TwitchGetHypeTrainEventsResponse:
	var result = TwitchGetHypeTrainEventsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchHypeTrainEvent.from_json(value));
	if d.has("pagination") && d["pagination"] != null:
		result.pagination = GetHypeTrainEventsResponsePagination.from_json(d["pagination"]);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value.to_dict());
	if pagination != null:
		d["pagination"] = pagination.to_dict();
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## Contains the information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read More](https://dev.twitch.tv/docs/api/guide#pagination)
class GetHypeTrainEventsResponsePagination extends RefCounted:
	## The cursor used to get the next page of results. Use the cursor to set the request’s _after_ query parameter.
	var cursor: String;

	static func from_json(d: Dictionary) -> GetHypeTrainEventsResponsePagination:
		var result = GetHypeTrainEventsResponsePagination.new();
		result.cursor = d["cursor"];
		return result;

	func to_json() -> String:
		return JSON.stringify(to_dict());

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["cursor"] = cursor;
		return d;
