extends CharacterBody2D

@export var speed = 300
@export var gravity = 1000 
@export var jump_force = -400  
@onready var animation_player = $AnimationPlayer
func get_input():
	var input_direction = Input.get_axis("left", "right")
	velocity.x = input_direction * speed

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force  

func _physics_process(delta):
	animation_player.play("idle")
	if not is_on_floor():
		velocity.y += gravity * delta  
	
	get_input()
	move_and_slide()
