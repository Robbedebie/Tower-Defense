extends Node

var score = 0
enum difficulties{EASY, MEDIUM, HARD}
var difficulty = difficulties.EASY
var wave = 0

func add_score(scoreToAdd):
	score += scoreToAdd * get_score_modifier()

func substract_score(scoreToSubstract):
	score -= scoreToSubstract
	
func get_score():
	return score

func get_wave():
	return wave

func reset_score():
	score = 50
	wave = 0
	
func set_difficulty(difficultyToSet):
	difficulty = difficultyToSet

func get_score_modifier():
	if difficulty == difficulties.EASY:
		return 3
	if difficulty == difficulties.MEDIUM:
		return 2
	if difficulty == difficulties.HARD:
		return 1
