extends Node2D

var n_waves = 0
var lifes = 3
var game_over = false
var game_paused = false
var sequence_timer
var upper_part
var thinking_track

func _ready():
	sequence_timer = get_node("sequence_timer")
	upper_part = get_node("upper_part")
	thinking_track = get_node("thinking_track")

func generate_new_wave():
	upper_part.start_wave()
	thinking_track.generate_new_thoughts(n_waves)

func _on_thinking_track_pressed_correct_key():
	get_node("UpperPart").pressed_correct_key()

func _on_thinking_track_pressed_wrong_key():
	get_node("UpperPart").pressed_wrong_key()
	
func _on_thinking_track_completed_key_sequence():
	n_waves += 1
	get_node("UpperPart").jumpwave()

func _on_thinking_track_sequence_timeout():
	get_node("UpperPart").lost_a_life()
