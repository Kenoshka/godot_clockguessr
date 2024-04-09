extends Control

func _on_hard_button_pressed():
	Glob.difficulty = 1
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_easy_button_pressed():
	Glob.difficulty = 0
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
