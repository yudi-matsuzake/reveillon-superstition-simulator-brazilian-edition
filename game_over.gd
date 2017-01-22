extends Node2D

func _ready():

	var highscore_label = get_node("highscore_label")
	var text = highscore_label.get_text()
	
	var highscore_manager = get_node("highscore")
	highscore_manager.check_and_save_highscore("Yudi", info.final_score)
	var h = highscore_manager.get_highscore()

	text += str(h["highscore"])
	highscore_label.set_text(text)
	set_process_input(true)
	

func start_game():
	get_tree().change_scene("res://the_game.tscn")

func _on_try_again_button_try_again_button_released():
	start_game()

func _input(event):
	if event.is_action_released("retry_button"):
		start_game()