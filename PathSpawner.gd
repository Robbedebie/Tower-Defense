extends Node2D

@export var number_of_enemies = 9
var counter = 0

@onready var path = preload("res://Levels/level1_path.tscn")
func _on_timer_timeout():
	counter += 1
	if counter <= number_of_enemies:
		var tempPath = path.instantiate()
		add_child(tempPath)
