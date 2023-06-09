extends Node

func _process(delta):
	$ScoreLabel.text = str(GlobalSingleton.get_score())
