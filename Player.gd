extends RigidBody3D

@export var forcePower : float = 0.0;
@export var torquePower : float = 0.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_press_spacebar(delta)
	pass

func _press_spacebar(delta : float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * forcePower)
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
