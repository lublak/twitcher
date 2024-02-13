@tool
extends RefCounted

class_name TwitchExtension

## The name of the user or organization that owns the extension.
var author_name: String;
## A Boolean value that determines whether the extension has features that use Bits. Is **true** if the extension has features that use Bits.
var bits_enabled: bool;
## A Boolean value that determines whether a user can install the extension on their channel. Is **true** if a user can install the extension.      Typically, this is set to **false** if the extension is currently in testing mode and requires users to be allowlisted (the allowlist is configured on Twitch’s [developer site](https://dev.twitch.tv/console/extensions) under the **Extensions** \-> **Extension** \-> **Version** \-> **Access**).
var can_install: bool;
## The location of where the extension’s configuration is stored. Possible values are:      * hosted — The Extensions Configuration Service hosts the configuration. * custom — The Extension Backend Service (EBS) hosts the configuration. * none — The extension doesn't require configuration.
var configuration_location: String;
## A longer description of the extension. It appears on the details page.
var description: String;
## A URL to the extension’s Terms of Service.
var eula_tos_url: String;
## A Boolean value that determines whether the extension can communicate with the installed channel’s chat. Is **true** if the extension can communicate with the channel’s chat room.
var has_chat_support: bool;
## A URL to the default icon that’s displayed in the Extensions directory.
var icon_url: String;
## No description available
var icon_urls: TwitchExtensionIconUrls;
## The extension’s ID.
var id: String;
## The extension’s name.
var name: String;
## A URL to the extension’s privacy policy.
var privacy_policy_url: String;
## A Boolean value that determines whether the extension wants to explicitly ask viewers to link their Twitch identity.
var request_identity_link: bool;
## A list of URLs to screenshots that are shown in the Extensions marketplace.
var screenshot_urls: Array[String];
## The extension’s state. Possible values are:      * Approved * AssetsUploaded * Deleted * Deprecated * InReview * InTest * PendingAction * Rejected * Released
var state: String;
## Indicates whether the extension can view the user’s subscription level on the channel that the extension is installed on. Possible values are:      * none — The extension can't view the user’s subscription level. * optional — The extension can view the user’s subscription level.
var subscriptions_support_level: String;
## A short description of the extension that streamers see when hovering over the discovery splash screen in the Extensions manager.
var summary: String;
## The email address that users use to get support for the extension.
var support_email: String;
## The extension’s version number.
var version: String;
## A brief description displayed on the channel to explain how the extension works.
var viewer_summary: String;
## Describes all views-related information such as how the extension is displayed on mobile devices.
var views: Views;
## Allowlisted configuration URLs for displaying the extension (the allowlist is configured on Twitch’s [developer site](https://dev.twitch.tv/console/extensions) under the **Extensions** \-> **Extension** \-> **Version** \-> **Capabilities**).
var allowlisted_config_urls: Array[String];
## Allowlisted panel URLs for displaying the extension (the allowlist is configured on Twitch’s [developer site](https://dev.twitch.tv/console/extensions) under the **Extensions** \-> **Extension** \-> **Version** \-> **Capabilities**).
var allowlisted_panel_urls: Array[String];

static func from_json(d: Dictionary) -> TwitchExtension:
	var result = TwitchExtension.new();
	if d.has("author_name") && d["author_name"] != null:
		result.author_name = d["author_name"];
	if d.has("bits_enabled") && d["bits_enabled"] != null:
		result.bits_enabled = d["bits_enabled"];
	if d.has("can_install") && d["can_install"] != null:
		result.can_install = d["can_install"];
	if d.has("configuration_location") && d["configuration_location"] != null:
		result.configuration_location = d["configuration_location"];
	if d.has("description") && d["description"] != null:
		result.description = d["description"];
	if d.has("eula_tos_url") && d["eula_tos_url"] != null:
		result.eula_tos_url = d["eula_tos_url"];
	if d.has("has_chat_support") && d["has_chat_support"] != null:
		result.has_chat_support = d["has_chat_support"];
	if d.has("icon_url") && d["icon_url"] != null:
		result.icon_url = d["icon_url"];
	if d.has("icon_urls") && d["icon_urls"] != null:
		result.icon_urls = TwitchExtensionIconUrls.from_json(d["icon_urls"]);
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	if d.has("name") && d["name"] != null:
		result.name = d["name"];
	if d.has("privacy_policy_url") && d["privacy_policy_url"] != null:
		result.privacy_policy_url = d["privacy_policy_url"];
	if d.has("request_identity_link") && d["request_identity_link"] != null:
		result.request_identity_link = d["request_identity_link"];
	if d.has("screenshot_urls") && d["screenshot_urls"] != null:
		for value in d["screenshot_urls"]:
			result.screenshot_urls.append(value);
	if d.has("state") && d["state"] != null:
		result.state = d["state"];
	if d.has("subscriptions_support_level") && d["subscriptions_support_level"] != null:
		result.subscriptions_support_level = d["subscriptions_support_level"];
	if d.has("summary") && d["summary"] != null:
		result.summary = d["summary"];
	if d.has("support_email") && d["support_email"] != null:
		result.support_email = d["support_email"];
	if d.has("version") && d["version"] != null:
		result.version = d["version"];
	if d.has("viewer_summary") && d["viewer_summary"] != null:
		result.viewer_summary = d["viewer_summary"];
	if d.has("views") && d["views"] != null:
		result.views = Views.from_json(d["views"]);
	if d.has("allowlisted_config_urls") && d["allowlisted_config_urls"] != null:
		for value in d["allowlisted_config_urls"]:
			result.allowlisted_config_urls.append(value);
	if d.has("allowlisted_panel_urls") && d["allowlisted_panel_urls"] != null:
		for value in d["allowlisted_panel_urls"]:
			result.allowlisted_panel_urls.append(value);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["author_name"] = author_name;
	d["bits_enabled"] = bits_enabled;
	d["can_install"] = can_install;
	d["configuration_location"] = configuration_location;
	d["description"] = description;
	d["eula_tos_url"] = eula_tos_url;
	d["has_chat_support"] = has_chat_support;
	d["icon_url"] = icon_url;
	if icon_urls != null:
		d["icon_urls"] = icon_urls.to_dict();
	d["id"] = id;
	d["name"] = name;
	d["privacy_policy_url"] = privacy_policy_url;
	d["request_identity_link"] = request_identity_link;
	d["screenshot_urls"] = [];
	if screenshot_urls != null:
		for value in screenshot_urls:
			d["screenshot_urls"].append(value);
	d["state"] = state;
	d["subscriptions_support_level"] = subscriptions_support_level;
	d["summary"] = summary;
	d["support_email"] = support_email;
	d["version"] = version;
	d["viewer_summary"] = viewer_summary;
	if views != null:
		d["views"] = views.to_dict();
	d["allowlisted_config_urls"] = [];
	if allowlisted_config_urls != null:
		for value in allowlisted_config_urls:
			d["allowlisted_config_urls"].append(value);
	d["allowlisted_panel_urls"] = [];
	if allowlisted_panel_urls != null:
		for value in allowlisted_panel_urls:
			d["allowlisted_panel_urls"].append(value);
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## Describes how the extension is displayed on mobile devices.
class Mobile extends RefCounted:
	## The HTML file that is shown to viewers on mobile devices. This page is presented to viewers as a panel behind the chat area of the mobile app.
	var viewer_url: String;


	static func from_json(d: Dictionary) -> Mobile:
		var result = Mobile.new();
		if d.has("viewer_url") && d["viewer_url"] != null:
			result.viewer_url = d["viewer_url"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["viewer_url"] = viewer_url;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## Describes how the extension is rendered if the extension may be activated as a panel extension.
class TwitchPanel extends RefCounted:
	## The HTML file that is shown to viewers on the channel page when the extension is activated in a Panel slot.
	var viewer_url: String;
	## The height, in pixels, of the panel component that the extension is rendered in.
	var height: int;
	## A Boolean value that determines whether the extension can link to non-Twitch domains.
	var can_link_external_content: bool;


	static func from_json(d: Dictionary) -> TwitchPanel:
		var result = TwitchPanel.new();
		if d.has("viewer_url") && d["viewer_url"] != null:
			result.viewer_url = d["viewer_url"];
		if d.has("height") && d["height"] != null:
			result.height = d["height"];
		if d.has("can_link_external_content") && d["can_link_external_content"] != null:
			result.can_link_external_content = d["can_link_external_content"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["viewer_url"] = viewer_url;
		d["height"] = height;
		d["can_link_external_content"] = can_link_external_content;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## Describes how the extension is rendered if the extension may be activated as a video-overlay extension.
class VideoOverlay extends RefCounted:
	## The HTML file that is shown to viewers on the channel page when the extension is activated on the Video - Overlay slot.
	var viewer_url: String;
	## A Boolean value that determines whether the extension can link to non-Twitch domains.
	var can_link_external_content: bool;


	static func from_json(d: Dictionary) -> VideoOverlay:
		var result = VideoOverlay.new();
		if d.has("viewer_url") && d["viewer_url"] != null:
			result.viewer_url = d["viewer_url"];
		if d.has("can_link_external_content") && d["can_link_external_content"] != null:
			result.can_link_external_content = d["can_link_external_content"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["viewer_url"] = viewer_url;
		d["can_link_external_content"] = can_link_external_content;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## Describes how the extension is rendered if the extension may be activated as a video-component extension.
class Component extends RefCounted:
	## The HTML file that is shown to viewers on the channel page when the extension is activated in a Video - Component slot.
	var viewer_url: String;
	## The width value of the ratio (width : height) which determines the extension’s width, and how the extension’s iframe will resize in different video player environments.
	var aspect_ratio_x: int;
	## The height value of the ratio (width : height) which determines the extension’s height, and how the extension’s iframe will resize in different video player environments.
	var aspect_ratio_y: int;
	## A Boolean value that determines whether to apply CSS zoom. If **true**, a CSS zoom is applied such that the size of the extension is variable but the inner dimensions are fixed based on Scale Pixels. This allows your extension to render as if it is of fixed width and height. If **false**, the inner dimensions of the extension iframe are variable, meaning your extension must implement responsiveness.
	var autoscale: bool;
	## The base width, in pixels, of the extension to use when scaling (see `autoscale`). This value is ignored if `autoscale` is **false**.
	var scale_pixels: int;
	## The height as a percent of the maximum height of a video component extension. Values are between 1% - 100%.
	var target_height: int;
	## A Boolean value that determines whether the extension can link to non-Twitch domains.
	var can_link_external_content: bool;


	static func from_json(d: Dictionary) -> Component:
		var result = Component.new();
		if d.has("viewer_url") && d["viewer_url"] != null:
			result.viewer_url = d["viewer_url"];
		if d.has("aspect_ratio_x") && d["aspect_ratio_x"] != null:
			result.aspect_ratio_x = d["aspect_ratio_x"];
		if d.has("aspect_ratio_y") && d["aspect_ratio_y"] != null:
			result.aspect_ratio_y = d["aspect_ratio_y"];
		if d.has("autoscale") && d["autoscale"] != null:
			result.autoscale = d["autoscale"];
		if d.has("scale_pixels") && d["scale_pixels"] != null:
			result.scale_pixels = d["scale_pixels"];
		if d.has("target_height") && d["target_height"] != null:
			result.target_height = d["target_height"];
		if d.has("can_link_external_content") && d["can_link_external_content"] != null:
			result.can_link_external_content = d["can_link_external_content"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["viewer_url"] = viewer_url;
		d["aspect_ratio_x"] = aspect_ratio_x;
		d["aspect_ratio_y"] = aspect_ratio_y;
		d["autoscale"] = autoscale;
		d["scale_pixels"] = scale_pixels;
		d["target_height"] = target_height;
		d["can_link_external_content"] = can_link_external_content;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## Describes the view that is shown to broadcasters while they are configuring your extension within the Extension Manager.
class Config extends RefCounted:
	## The HTML file shown to broadcasters while they are configuring your extension within the Extension Manager.
	var viewer_url: String;
	## A Boolean value that determines whether the extension can link to non-Twitch domains.
	var can_link_external_content: bool;


	static func from_json(d: Dictionary) -> Config:
		var result = Config.new();
		if d.has("viewer_url") && d["viewer_url"] != null:
			result.viewer_url = d["viewer_url"];
		if d.has("can_link_external_content") && d["can_link_external_content"] != null:
			result.can_link_external_content = d["can_link_external_content"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["viewer_url"] = viewer_url;
		d["can_link_external_content"] = can_link_external_content;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## Describes all views-related information such as how the extension is displayed on mobile devices.
class Views extends RefCounted:
	## Describes how the extension is displayed on mobile devices.
	var mobile: Mobile;
	## Describes how the extension is rendered if the extension may be activated as a panel extension.
	var panel: TwitchPanel;
	## Describes how the extension is rendered if the extension may be activated as a video-overlay extension.
	var video_overlay: VideoOverlay;
	## Describes how the extension is rendered if the extension may be activated as a video-component extension.
	var component: Component;
	## Describes the view that is shown to broadcasters while they are configuring your extension within the Extension Manager.
	var config: Config;


	static func from_json(d: Dictionary) -> Views:
		var result = Views.new();
		if d.has("mobile") && d["mobile"] != null:
			result.mobile = Mobile.from_json(d["mobile"]);
		if d.has("panel") && d["panel"] != null:
			result.panel = TwitchPanel.from_json(d["panel"]);
		if d.has("video_overlay") && d["video_overlay"] != null:
			result.video_overlay = VideoOverlay.from_json(d["video_overlay"]);
		if d.has("component") && d["component"] != null:
			result.component = Component.from_json(d["component"]);
		if d.has("config") && d["config"] != null:
			result.config = Config.from_json(d["config"]);
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		if mobile != null:
			d["mobile"] = mobile.to_dict();
		if panel != null:
			d["panel"] = panel.to_dict();
		if video_overlay != null:
			d["video_overlay"] = video_overlay.to_dict();
		if component != null:
			d["component"] = component.to_dict();
		if config != null:
			d["config"] = config.to_dict();
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

