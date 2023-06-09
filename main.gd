extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var enemies = $PathSpawner.get_children()
	if(enemies.size() == 1 && $PathSpawner.get_wave_finished()):
		get_tree().change_scene_to_file("res://main_menu.tscn")

func enemy_killed():
	GlobalSingleton.add_score(1)
