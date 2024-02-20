@tool
extends RefCounted

class_name TwitchVideo

## An ID that identifies the video.
var id: String;
## The ID of the stream that the video originated from if the video's type is "archive;" otherwise, **null**.
var stream_id: String;
## The ID of the broadcaster that owns the video.
var user_id: String;
## The broadcaster's login name.
var user_login: String;
## The broadcaster's display name.
var user_name: String;
## The video's title.
var title: String;
## The video's description.
var description: String;
## The date and time, in UTC, of when the video was created. The timestamp is in RFC3339 format.
var created_at: Variant;
## The date and time, in UTC, of when the video was published. The timestamp is in RFC3339 format.
var published_at: Variant;
## The video's URL.
var url: String;
## A URL to a thumbnail image of the video. Before using the URL, you must replace the `%{width}` and `%{height}` placeholders with the width and height of the thumbnail you want returned. Due to current limitations, `${width}` must be 320 and `${height}` must be 180.
var thumbnail_url: String;
## The video's viewable state. Always set to **public**.
var viewable: String;
## The number of times that users have watched the video.
var view_count: int;
## The ISO 639-1 two-letter language code that the video was broadcast in. For example, the language code is DE if the video was broadcast in German. For a list of supported languages, see [Supported Stream Language](https://help.twitch.tv/s/article/languages-on-twitch#streamlang). The language value is "other" if the video was broadcast in a language not in the list of supported languages.
var language: String;
## The video's type. Possible values are:      * archive — An on-demand video (VOD) of one of the broadcaster's past streams. * highlight — A highlight reel of one of the broadcaster's past streams. See [Creating Highlights](https://help.twitch.tv/s/article/creating-highlights-and-stream-markers). * upload — A video that the broadcaster uploaded to their video library. See Upload under [Video Producer](https://help.twitch.tv/s/article/video-on-demand?language=en%5FUS#videoproducer).
var type: String;
## The video's length in ISO 8601 duration format. For example, 3m21s represents 3 minutes, 21 seconds.
var duration: String;
## The segments that Twitch Audio Recognition muted; otherwise, **null**.
var muted_segments: Array[MutedSegments];

static func from_json(d: Dictionary) -> TwitchVideo:
	var result = TwitchVideo.new();
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	if d.has("stream_id") && d["stream_id"] != null:
		result.stream_id = d["stream_id"];
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("user_login") && d["user_login"] != null:
		result.user_login = d["user_login"];
	if d.has("user_name") && d["user_name"] != null:
		result.user_name = d["user_name"];
	if d.has("title") && d["title"] != null:
		result.title = d["title"];
	if d.has("description") && d["description"] != null:
		result.description = d["description"];
	if d.has("created_at") && d["created_at"] != null:
		result.created_at = d["created_at"];
	if d.has("published_at") && d["published_at"] != null:
		result.published_at = d["published_at"];
	if d.has("url") && d["url"] != null:
		result.url = d["url"];
	if d.has("thumbnail_url") && d["thumbnail_url"] != null:
		result.thumbnail_url = d["thumbnail_url"];
	if d.has("viewable") && d["viewable"] != null:
		result.viewable = d["viewable"];
	if d.has("view_count") && d["view_count"] != null:
		result.view_count = d["view_count"];
	if d.has("language") && d["language"] != null:
		result.language = d["language"];
	if d.has("type") && d["type"] != null:
		result.type = d["type"];
	if d.has("duration") && d["duration"] != null:
		result.duration = d["duration"];
	if d.has("muted_segments") && d["muted_segments"] != null:
		for value in d["muted_segments"]:
			result.muted_segments.append(MutedSegments.from_json(value));
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["id"] = id;
	d["stream_id"] = stream_id;
	d["user_id"] = user_id;
	d["user_login"] = user_login;
	d["user_name"] = user_name;
	d["title"] = title;
	d["description"] = description;
	d["created_at"] = created_at;
	d["published_at"] = published_at;
	d["url"] = url;
	d["thumbnail_url"] = thumbnail_url;
	d["viewable"] = viewable;
	d["view_count"] = view_count;
	d["language"] = language;
	d["type"] = type;
	d["duration"] = duration;
	d["muted_segments"] = [];
	if muted_segments != null:
		for value in muted_segments:
			d["muted_segments"].append(value.to_dict());
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

##
class MutedSegments extends RefCounted:
	## The duration of the muted segment, in seconds.
	var duration: int;
	## The offset, in seconds, from the beginning of the video to where the muted segment begins.
	var offset: int;


	static func from_json(d: Dictionary) -> MutedSegments:
		var result = MutedSegments.new();
		if d.has("duration") && d["duration"] != null:
			result.duration = d["duration"];
		if d.has("offset") && d["offset"] != null:
			result.offset = d["offset"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["duration"] = duration;
		d["offset"] = offset;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

