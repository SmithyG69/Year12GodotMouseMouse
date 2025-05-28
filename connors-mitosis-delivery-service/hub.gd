extends Node2D  # or Panel, depending on your main node

@export var hub_id: int = 0
@export var max_capacity: int = 10

var cloned_items: int = 0

@onready var clone_button = $CloneButton
@onready var count_label = $ItemCountLabel

func _ready():
	update_display()
	$clone_button.pressed.connect(_on_clone_button_pressed)

func _on_clone_button_pressed():
	if cloned_items < max_capacity:
		cloned_items += 1
		update_display()
		print("Hub %d cloned item. Total: %d" % [hub_id, cloned_items])
	else:
		print("Hub %d is at full capacity!" % hub_id)

func update_display():
	$count_label.text = "Cloned: %d / %d" % [cloned_items, max_capacity]
