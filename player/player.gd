extends CharacterBody2D

@export var speed = 300
@export var gravity = 1000  # Earth's gravity in pixels/sec²
@export var jump_force = -400  # Negative because jumping moves the player upwards

func get_input():
	var input_direction = Input.get_axis("left", "right")
	velocity.x = input_direction * speed

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force  # Apply jump force if on the floor

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta  # Integrate gravity over time
	
	get_input()
	move_and_slide()
