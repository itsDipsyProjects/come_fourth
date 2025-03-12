extends Area2D

@onready var Label1 = $"../Label"
@onready var timer = $"../Timer"

func _ready():
	connect("body_entered", _on_body_entered);

func _on_body_entered(body):
	if body.is_in_group("player"):
		Label1.text = "You have Won!!!!";
		timer.wait_time = 3.0;
		timer.one_shot = true;
		timer.start();
		timer.timeout.connect(_restart_level) 

func _restart_level():
	print("Restarting...");
	get_tree().reload_current_scene()
