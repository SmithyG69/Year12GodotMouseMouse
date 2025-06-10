extends Node

var hub_data_list := {}

func get_hub_data(hub_id: int) -> HubData:
	if hub_data_list.has(hub_id):
		return hub_data_list[hub_id]
	
	# Create new data if not found
	var data = HubData.new()
	data.hub_id = hub_id
	hub_data_list[hub_id] = data
	return data
	
