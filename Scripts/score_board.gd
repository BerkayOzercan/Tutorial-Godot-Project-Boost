extends Control

@onready var game_manager : Node = %"GameManager"
@export var collected_label : Label
@export var time_label : Label

func _ready() -> void:
	self.hide()

func set_scores():
	collected_label.text = "COLLECTED: " + str(game_manager.game_score)
	time_label.text = "TIME: " + str(snapped(game_manager.time, 0.01))

func _on_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_interval(0.1)
	tween.tween_callback(
		get_tree().change_scene_to_file.bind(game_manager.level_file_path)
	)

func _on_button_2_pressed() -> void:
	get_tree().quit()
	
	


