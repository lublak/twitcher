@tool
extends RefCounted

class_name TwitchUpdateDropsEntitlementsBody

## A list of IDs that identify the entitlements to update. You may specify a maximum of 100 IDs.
var entitlement_ids: Array[String];
## The fulfillment status to set the entitlements to. Possible values are:      * CLAIMED — The user claimed the benefit. * FULFILLED — The developer granted the benefit that the user claimed.
var fulfillment_status: String;

static func from_json(d: Dictionary) -> TwitchUpdateDropsEntitlementsBody:
	var result = TwitchUpdateDropsEntitlementsBody.new();
	if d.has("entitlement_ids") && d["entitlement_ids"] != null:
		for value in d["entitlement_ids"]:
			result.entitlement_ids.append(value);
	if d.has("fulfillment_status") && d["fulfillment_status"] != null:
		result.fulfillment_status = d["fulfillment_status"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["entitlement_ids"] = [];
	if entitlement_ids != null:
		for value in entitlement_ids:
			d["entitlement_ids"].append(value);
	d["fulfillment_status"] = fulfillment_status;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
