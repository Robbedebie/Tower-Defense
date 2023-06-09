extends Node

func _process(delta):
	$ScoreLabel.text = "score " + str(GlobalSingleton.get_score())
	$WaveLabel.text = "wave " +  str(GlobalSingleton.get_wave())
