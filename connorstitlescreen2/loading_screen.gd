extends Control

@onready var video = $VideoPlayer

func _ready():
	video.set_anchors_preset(Control.PRESET_FULL_RECT)
	video.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	video.size_flags_vertical = Control.SIZE_EXPAND_FILL
	video.expand = true

	if video.stream:
		video.play()
	else:
		push_error("No video stream assigned to VideoPlayer!")

	video.finished.connect(_on_video_finished)

func _on_video_finished():
	get_tree().change_scene_to_file("res://titlescreen3d.tscn")
