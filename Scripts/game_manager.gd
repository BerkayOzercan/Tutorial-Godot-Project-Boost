extends Node3D

var game_score : int = 0

@export_file("*.tscn") var level_file_path
@onready var score_board : Control = %"ScoreBoard"

func add_point(point: int):
	game_score += point
	print(game_score)

func  show_score_board(is_show: bool):
	if is_show == true:
		score_board.show()
	else:
		score_board.hide()


	
