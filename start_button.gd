extends Node2D
signal start_button_released

func _ready():
	pass

func _on_button_background_start_button_released():
	emit_signal("start_button_released")