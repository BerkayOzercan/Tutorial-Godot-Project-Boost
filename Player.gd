extends RigidBody3D

@export var forcePower : float = 0.0;
@export var torquePower : float = 0.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_press_spacebar(_delta)
	pass

func _press_spacebar(delta : float) -> void:
	if Input.is_action_pressed("ui_accept"):
		apply_central_force(basis.y * delta * forcePower)
	if Input.is_action_pressed("ui_right"):
		apply_torque(Vector3(0.0, 0.0, -torquePower * delta))
	if Input.is_action_pressed("ui_left"):
		apply_torque(Vector3(0.0, 0.0, torquePower * delta))
