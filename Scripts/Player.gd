extends RigidBody3D

##Set the thrust power value
@export_range(500.0, 1500.0) var thrustPower : float = 1000.0;

##Set the torque power value
@export_range(50.0, 150.0) var torquePower : float = 100.0;

var is_transitioning : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_press_spacebar(delta)
	pass

func _press_spacebar(delta : float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thrustPower)
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, torquePower * delta))
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -torquePower * delta))

func _on_body_entered(body:Node) -> void:
	if is_transitioning == false:
		if "Goal" in body.get_groups():
			_complete_level(body.level_file_path)
		elif "Hazard" in body.get_groups():
			_crash_sequence()
	
func _complete_level(next_level: String) -> void:
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(
		get_tree().change_scene_to_file.bind(next_level)
	)
	print("You Win!")

func _crash_sequence() -> void:
	set_process(false)
	is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().reload_current_scene)
	print("Kaboom!")
