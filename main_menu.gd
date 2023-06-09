extends Node

func _on_new_game_button_button_up():
	GlobalSingleton.reset_score()
	get_tree().change_scene_to_file("res://main.tscn")

func _on_options_button_button_up():
	get_tree().change_scene_to_file("res://options_menu.tscn")

func _on_exit_button_button_up():
	get_tree().quit()
