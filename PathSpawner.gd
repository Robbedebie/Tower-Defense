extends Node2D

@onready var path = preload("res://Levels/level1_path.tscn")
func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
