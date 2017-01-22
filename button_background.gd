extends Sprite

signal start_button_released

var button_background = [ preload("res://img/button_normal.png"),
						  preload("res://img/button_pressed.png") ]

var bg_normal  = 0
var bg_pressed = 1

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON and event.pressed):
		set_texture(button_background[bg_pressed])
	elif (event.type == InputEvent.MOUSE_BUTTON):
		set_texture(button_background[bg_normal])
		emit_signal("start_button_released")

func _ready():
	set_process_input(true)