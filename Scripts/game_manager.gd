extends Node

var game_score : int = 0

func add_point(point: int):
	game_score += point
	print(game_score)