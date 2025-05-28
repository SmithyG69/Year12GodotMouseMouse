extends Node

var active_request: Resource = null  # This will be a DeliveryRequest
signal request_accepted(request)
signal request_completed(request)

func accept_request(request):
	active_request = request
	emit_signal("request_accepted", request)
	print("Accepted request:", request)

func complete_request():
	if active_request:
		active_request.set("is_completed", true)
		emit_signal("request_completed", active_request)
		print("Completed request:", active_request)
		active_request = null
