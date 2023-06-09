extends CharacterBody2D

var speed = 100
var health = 10
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + (speed + (GlobalSingleton.get_wave() * 10)) * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	
	if health <= 0:
		get_parent().get_parent().queue_free()
		get_parent().get_parent().get_parent().get_parent().enemy_killed()
		
