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

func _on_tower_body_entered(body):
	if "Enemy" in body.name:
		var enemiesArray = []
		currentTargets = get_node("Tower").get_overlapping_bodies()
		
		for target in currentTargets:
			if "Enemy" in target.name:
				enemiesArray.append(target)
				
		var currentTarget = null
		
		for enemy in enemiesArray:
			if currentTarget == null:
				currentTarget = enemy.get_node("../")
			else:
				if enemy.get_parent().get_progress() > currentTarget.get_progress():
					currentTarget = enemy.get_node("../")
					
		currentFurthestTarget = currentTarget
		pathName = currentTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		tempBullet.global_position = $Aim.global_position
		get_node("BulletContainer").add_child(tempBullet)
		
func _on_tower_body_exited(body):
	currentTargets = get_node("Tower").get_overlapping_bodies()
	
func remove_all_bullets_locked_on_target():
	for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()
