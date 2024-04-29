extends Area3D

@onready var game_manager : Node = %"GameManager"

func _on_body_entered(body:Node3D) -> void:
	if body.name == "Player":
		game_manager.add_point(1)
		queue_free()
