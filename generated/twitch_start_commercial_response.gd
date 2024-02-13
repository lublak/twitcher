@tool
extends RefCounted

class_name TwitchStartCommercialResponse

## An array that contains a single object with the status of your start commercial request.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchStartCommercialResponse:
	var result = TwitchStartCommercialResponse.new();
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
	## The length of the commercial you requested. If you request a commercial that’s longer than 180 seconds, the API uses 180 seconds.
	var length: int;
	## A message that indicates whether Twitch was able to serve an ad.
	var message: String;
	## The number of seconds you must wait before running another commercial.
	var retry_after: int;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("length") && d["length"] != null:
			result.length = d["length"];
		if d.has("message") && d["message"] != null:
			result.message = d["message"];
		if d.has("retry_after") && d["retry_after"] != null:
			result.retry_after = d["retry_after"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["length"] = length;
		d["message"] = message;
		d["retry_after"] = retry_after;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

