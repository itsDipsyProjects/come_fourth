extends Control

var ui_visible = false
var esc_pressed = false

func _ready():
	self.visible = false
	$VBoxContainer/restart.pressed.connect(_on_restart_pressed)
	$VBoxContainer/exit.pressed.connect(_on_exit_pressed)

func _process(delta):

	if Input.is_action_just_pressed("ui_cancel") and !esc_pressed:
		esc_pressed = true  
		if ui_visible:
			self.visible = false
			ui_visible = false
			
		else:
			self.visible = true
			ui_visible = true
		
func _input(event):
	if event.is_action_released("ui_cancel"):
		esc_pressed = false

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_exit_pressed():
	get_tree().quit()
