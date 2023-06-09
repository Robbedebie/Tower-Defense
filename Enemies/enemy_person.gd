extends CharacterBody2D

@export var speed = 100
@export var health = 10
@export var enemies_killed = 0
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	
	if health <= 0:
		get_parent().get_parent().queue_free()
		get_parent().get_parent().get_parent().get_parent().enemy_killed()
		
