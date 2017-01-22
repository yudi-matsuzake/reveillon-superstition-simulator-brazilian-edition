extends Node2D

func _ready():
	set_process_input(true)

func start_game():
	get_tree().change_scene("res://the_game.tscn")

func _on_try_again_button_try_again_button_released():
	start_game()

func _input(event):
	if event.is_action_released("retry_button"):
		start_game()