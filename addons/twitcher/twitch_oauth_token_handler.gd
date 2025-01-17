extends "res://addons/twitcher/lib/oOuch/token_handler.gd"

class_name TwitchTokenHandler

## Time between checking the validation of the tokens
var _last_validation_check: int = 0

func _check_token_refresh() -> void:
	super._check_token_refresh()

	if _last_validation_check < Time.get_ticks_msec():
		_last_validation_check = Time.get_ticks_msec() + 60 * 60 * 1000;
		_validate_token()

## Calles the validation endpoint of Twtich to make sure
func _validate_token() -> void:
	var validation_request = _http_client.request("/oauth2/validate", HTTPClient.METHOD_GET, {
		"Authorization": "OAuth %s" % _tokens.get_access_token()
	}, "")
	var response = await _http_client.wait_for_request(validation_request)
	if response.response_code != 200:
		refresh_tokens()
		return

	var response_string: String = response.response_data.get_string_from_utf8();
	var response_data = JSON.parse_string(response_string);
	if response_data["expires_in"] <= 0:
		refresh_tokens()
		return
