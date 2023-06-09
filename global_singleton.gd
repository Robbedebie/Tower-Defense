extends Node

var score = 0
enum difficulties{EASY, MEDIUM, HARD}
var difficulty = difficulties.EASY

func add_score(scoreToAdd):
	score += scoreToAdd * get_score_modifier()
	
func get_score():
	return score
	
func set_difficulty(difficultyToSet):
	difficulty = difficultyToSet

func get_score_modifier():
	if difficulty == difficulties.EASY:
		return 3
	if difficulty == difficulties.MEDIUM:
		return 2
	if difficulty == difficulties.HARD:
		return 1
