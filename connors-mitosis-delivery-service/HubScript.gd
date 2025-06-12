extends Node3D

@export var model_to_clone: PackedScene  # Assign your 3D model scene (e.g. Crate.tscn)
@onready var cloning_area = $CloningArea
@onready var start_button = $UIContainer/CanvasLayer/Control/VBoxContainer/start
@onready var timer = $CloningArea/Timer

var clone_count = 50  # how many to spawn
var spacing = 1    # space between them

func _ready():
	start_button.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	for i in range(clone_count):
		var clone = model_to_clone.instantiate()
		var pos = Vector3(i * spacing, randi_range(0.01,0.1), randi_range(0.01,0.1))
		clone.position = pos
		cloning_area.add_child(clone)
		clone.scale = Vector3(0.1,0.1,0.1)
#func _process(delta):
#	if data:
		#data.process_clone(delta)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
