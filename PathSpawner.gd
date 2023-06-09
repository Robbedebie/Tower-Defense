extends Node2D

var number_of_enemies = 9
var wave_finished = true
var counter = 0

@onready var path = preload("res://Levels/level1_path.tscn")
func _on_timer_timeout():
	if counter <= number_of_enemies and wave_finished == false:
		counter += 1
		var tempPath = path.instantiate()
		add_child(tempPath)
	else:
		wave_finished = true
		counter = 0
		
func get_wave_finished():
	return wave_finished
	
func start_wave():
	wave_finished = false
	counter = 0
	number_of_enemies += GlobalSingleton.get_wave() * 2
	$Timer.wait_time = 1 - GlobalSingleton.get_wave() * 0.05
	
