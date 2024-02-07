extends RefCounted

## Direct access to the chat
class_name TwitchChannel

## When the channel state got updated like (see https://dev.twitch.tv/docs/irc/tags/#roomstate-tags)
signal update(tags: Dictionary);
## when a chat message in this channel got received
signal message_received(senderdata : TwitchSenderData, msg: String);

var channel_name: String;
var data: Dictionary = {};
var irc: TwitchIRC;

func _init(channel: String, twitch_irc: TwitchIRC):
	channel_name = channel;
	irc = twitch_irc
	irc.chat_message.connect(_message_received);

func update_tags(tags: Dictionary):
	for key in tags:
		data[key] = tags[key];
	update.emit(tags);

func _message_received(senderdata : TwitchSenderData, message : String):
	message_received.emit(senderdata, message);

func chat(message: String) -> void:
	irc.chat(message);
