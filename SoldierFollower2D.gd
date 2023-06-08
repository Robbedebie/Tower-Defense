extends PathFollow2D

@export var speed = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(get_parent().get_progress()) + speed * delta)
