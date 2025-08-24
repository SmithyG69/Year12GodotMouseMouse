extends Control

@onready var video_player = $VideoPlayer
@onready var video_display = $TextureRect

func _ready():
	if not video_player:
		push_error("VideoPlayer node not found!")
		return

	if not video_player.stream:
		push_error("No video stream assigned to VideoPlayer!")
		return

	video_player.play()
	video_player.finished.connect(_on_video_finished)

	call_deferred("_assign_video_texture")

func _assign_video_texture():
	var tex = video_player.get_video_texture()
	if tex:
		video_display.texture = tex
		video_display.stretch_mode = TextureRect.StretchMode.STRETCH_KEEP_ASPECT_CENTERED
	else:
		push_error("VideoPlayer texture not ready yet!")

func _on_video_finished():
	get_tree().change_scene_to_file("res://titlescreen3d.tscn")
