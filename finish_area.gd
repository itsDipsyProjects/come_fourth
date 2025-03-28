extends Area2D

@onready var Label1 = $"../Label"
var activated := false  

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		Label1.text = "Go to house now, to finish level"
		activated = true  
