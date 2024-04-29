extends Node

var time : float = 0
var is_time_start : bool = false

var game_score : int = 0


@export_file("*.tscn") var level_file_path
@onready var score_board : Control = %"ScoreBoard"

func _ready():
	is_time_start = true

func _process(delta) -> void:
	if is_time_start == true:
		time += delta
		print(snapped(time, 0.01))
	pass

func add_point(point: int):
	game_score += point
	print(game_score)

func  show_score_board(is_show: bool):
	if is_show == true:
		is_time_start = false
		score_board.set_scores()
		score_board.show()
	else:
		score_board.hide()


	
