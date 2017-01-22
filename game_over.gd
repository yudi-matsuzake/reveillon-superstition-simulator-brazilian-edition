extends Node2D

func _ready():
	pass

func start_game():
	get_tree().change_scene("res://the_game.tscn")

func _on_try_again_button_try_again_button_released():
	start_game()