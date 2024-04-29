extends Area3D

@onready var game_manager : Node = %"GameManager"

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	var random_destination = rng.randf_range(1.0, 3.0)
	var destination = Vector3(0.0, random_destination, 0.0)

	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "global_position", global_position + destination, 1.0)
	tween.tween_property(self, "global_position", global_position, 1.0)

func _on_body_entered(body:Node3D) -> void:
	if body.name == "Player":
		game_manager.add_point(1)
		queue_free()
