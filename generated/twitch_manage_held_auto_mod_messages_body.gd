@tool
extends RefCounted

class_name TwitchManageHeldAutoModMessagesBody

## The moderator who is approving or denying the held message. This ID must match the user ID in the access token.
var user_id: String;
## The ID of the message to allow or deny.
var msg_id: String;
## The action to take for the message. Possible values are:      * ALLOW * DENY
var action: String;

static func from_json(d: Dictionary) -> TwitchManageHeldAutoModMessagesBody:
	var result = TwitchManageHeldAutoModMessagesBody.new();
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("msg_id") && d["msg_id"] != null:
		result.msg_id = d["msg_id"];
	if d.has("action") && d["action"] != null:
		result.action = d["action"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["user_id"] = user_id;
	d["msg_id"] = msg_id;
	d["action"] = action;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
