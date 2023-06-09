extends StaticBody2D

var Bullet = preload("res://Towers/red_bullet.tscn")
@export var bulletDamage = 5
var pathName
var currentTargets = []
var currentFurthestTarget

func _process(delta):
	if is_instance_valid(currentFurthestTarget):
		self.look_at(currentFurthestTarget.global_position)
	else:
		remove_all_bullets_locked_on_target()
	
func remove_all_bullets_locked_on_target():
	for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()


func _on_timer_timeout():
	var bodies_in_range = get_node("Tower").get_overlapping_bodies()
	var enemies_in_range = []
	for body in bodies_in_range:
		if "Enemy" in body.name:
			enemies_in_range.append(body)
	if enemies_in_range.size() == 0:
		pass
	var currentTarget = null

	for enemy in enemies_in_range:
		if currentTarget == null:
			currentTarget = enemy.get_node("../")
		else:
			if enemy.get_parent().get_progress() > currentTarget.get_progress():
				currentTarget = enemy.get_node("../")
	currentFurthestTarget = currentTarget
	if currentTarget != null:
		pathName = currentTarget.get_parent().name
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		tempBullet.global_position = $Aim.global_position
		get_node("BulletContainer").add_child(tempBullet)
