extends RigidBody3D

##Set the thrust power value
@export_range(500.0, 1500.0) var thrustPower : float = 1000.0;

##Set the torque power value
@export_range(50.0, 150.0) var torquePower : float = 100.0;

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
	if "Goal" in body.get_groups():
		print("You Win!")
	elif "Hazard" in body.get_groups():
		print("Your Crashed!")
	pass # Replace with function body.
