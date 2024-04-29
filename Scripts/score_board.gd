extends Control

@onready var game_manager : Node3D = %"GameManager"

func _ready() -> void:
	self.hide()

func _on_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_interval(0.1)
	tween.tween_callback(
		get_tree().change_scene_to_file.bind(game_manager.level_file_path)
	)

func _on_button_2_pressed() -> void:
	get_tree().quit()
	
	


