extends CharacterBody2D

@export var speed = 300;
@onready var _animation_player = $AnimationPlayer;	

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	_animation_player.play("idle_player");
	get_input();
	move_and_slide();
