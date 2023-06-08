extends StaticBody2D

var Bullet = preload("res://Towers/red_bullet.tscn")
var bulletDamage = 5
var pathName
var currentTargets = []
var currentFurthestTarget

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
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position
		
func _on_tower_body_exited(body):
	pass # Replace with function body.
