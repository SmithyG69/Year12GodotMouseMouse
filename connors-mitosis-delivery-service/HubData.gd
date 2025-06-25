extends Resource
class_name HubData

var hub_id: int
var items_cloned: int = 0
var clone_speed: float = 1.0
var last_updated_time: float = 0.0

func process_clone(delta: float):
	# Update cloning progress based on time
	items_cloned += clone_speed * delta
