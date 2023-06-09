extends VBoxContainer


func _on_next_wave_button_button_up():
	get_parent().get_parent().get_parent().get_parent().start_wave()


func _on_exit_button_button_up():
	get_tree().change_scene_to_file("res://main_menu.tscn")
