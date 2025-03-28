extends Area2D

@onready var timer = $"../Timer"
@onready var pressure_plate = $"../presurePlateArea"  

func _ready():
	connect("body_entered", _on_body_entered)
	timer.connect("timeout", _on_timer_timeout)

func _on_body_entered(body):
	if body.is_in_group("player") and pressure_plate.activated:
		timer.start(3.0)

func _on_timer_timeout():
	get_tree().reload_current_scene()
