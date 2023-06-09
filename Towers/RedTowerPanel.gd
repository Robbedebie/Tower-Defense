extends Panel

@onready var tower = preload("res://Towers/red_bullet_tower.tscn")
var currTile

func _on_gui_input(event):
	if GlobalSingleton.get_score() >= 20:
		var tempTower = tower.instantiate()
		if event is InputEventMouseButton and event.button_mask == 1:
			#left click down
			add_child(tempTower)
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		elif event is InputEventMouseMotion and event.button_mask == 1:
			#left click down drag
			get_child(1).global_position = event.global_position
			
		elif event is InputEventMouseButton and event.button_mask == 0:
			print("left mouse button up")
			# get current  global_position of dragged tower 
			var drop_pos = get_child(1).global_position
			drop_pos.x -= 905
			drop_pos.y -= 520 # were we want the tower
			
			get_child(1).queue_free()
			var path = get_tree().get_root().get_node("Main/Towers")
			path.add_child(tempTower)
			# temp_tower.global_position = event.global_position
			tempTower.global_position = drop_pos
			tempTower.get_node("Area").hide()
			GlobalSingleton.substract_score(20)
