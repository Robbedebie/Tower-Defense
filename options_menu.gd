extends Node

enum difficulties{EASY, MEDIUM, HARD}

@export var difficulty = difficulties.EASY

func _on_easy_button_button_up():
	difficulty = difficulties.EASY
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_medium_button_button_up():
	difficulty = difficulties.MEDIUM
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_hard_button_button_up():
	difficulty = difficulties.HARD
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_back_button_button_up():
	get_tree().change_scene_to_file("res://main_menu.tscn")
