extends Node

func enemy_killed():
	GlobalSingleton.add_score(1)

func start_wave():
	GlobalSingleton.wave += 1
	$PathSpawner.start_wave()
