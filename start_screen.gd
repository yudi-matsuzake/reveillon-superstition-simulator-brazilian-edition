extends Node2D

func _ready():
	set_process_input(true)

func start_game():
	get_tree().change_scene("res://the_game.tscn")

func _input(event):
	if event.is_action_released("start_game"):
		start_game()

func _on_start_button_start_button_released():
	start_game()
