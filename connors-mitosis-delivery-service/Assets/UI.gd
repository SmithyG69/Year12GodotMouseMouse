extends Control

func _on_start_pressed():
	# Replace with your first gameplay scene
	get_tree().change_scene_to_file("res://scenes/Game.tscn")

func _on_options_pressed():
	# Open your options menu (popup or change scene)
	pass

func _on_quit_pressed():
	get_tree().quit()
