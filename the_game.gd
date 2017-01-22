extends Node2D

const GETTING_HIT = 0
const JUMPING_WAVE = 1
const STANDING = 2
const GAME_OVER = 3
const GAME_PAUSED = 4

const PAUSE_TIME = 0.5

var n_waves = 0
var lifes = 3
var sequence_timer
var upper_part
var thinking_track
var current_action = STANDING

var bonus_counter = 0
var final_score = 0
var combo_count = 0
var waves_jumped_label
var bonus_list

func _ready():
	sequence_timer = get_node("sequence_timer")
	upper_part = get_node("upper_part")
	thinking_track = get_node("thinking_track")
	waves_jumped_label = get_node("WavesJumpedLabel")
	bonus_list = [ 	{ 	'pre_text' : 'comeu lentilha',	'text' : "+felicidade", 	'texture' : preload("res://img/bonus/lentilha_luz.png")},
					{	'pre_text' : 'tomou champagne', 'text' : "+prosperidade", 	'texture' : preload("res://img/bonus/champagne_luz.png")},
					{	'pre_text' : 'comeu uva',		'text' : "+dinheiro", 		'texture' : preload("res://img/bonus/uvas_sm.png")}
				 ]
	generate_new_wave()
	set_process(true)
	
func _process(delta):
	display_score()

func generate_new_wave():
	if current_action != GAME_OVER :
		upper_part.start_wave()
		thinking_track.generate_new_thoughts(n_waves)
		sequence_timer.set_wait_time(5)
		sequence_timer.start()

func _on_thinking_track_pressed_correct_key():
	upper_part.pressed_correct_key()

func _on_thinking_track_pressed_wrong_key():
	current_action = GETTING_HIT
	sequence_timer.stop()
	sequence_timer.set_wait_time(PAUSE_TIME)
	sequence_timer.start()
	decrement_life()
	upper_part.got_hit_by_wave(PAUSE_TIME)
	thinking_track.clear()
	check_game_over()
	
# COMPLETED SEQUENCE, INCREMENT COUNTER
func _on_thinking_track_completed_key_sequence():
	increase_wave_number()
	current_action = JUMPING_WAVE
	# start timer to know when character finished jumping wave
	sequence_timer.stop()
	sequence_timer.set_wait_time(PAUSE_TIME)
	sequence_timer.start()
	upper_part.jumpwave(PAUSE_TIME, combo_count)

func _on_sequence_timer_timeout():
	if (current_action == STANDING):
		# timed out while standing -> got hit
		decrement_life()
		thinking_track.clear()
		decrement_life()
		upper_part.lost_a_life()
		check_game_over()
		current_action = GETTING_HIT
		sequence_timer.set_wait_time(PAUSE_TIME)
		sequence_timer.start()
		
	elif (current_action == GETTING_HIT):
		current_action = STANDING
		generate_new_wave()
	elif (current_action == JUMPING_WAVE):
		current_action = STANDING
		generate_new_wave()
		
		
func increase_wave_number():
	n_waves += 1
	combo_count += 1
	if combo_count % 7 == 0 :
		var bonus = bonus_list[randi() % bonus_list.size()]
		upper_part.give_bonus(bonus)
		bonus_counter += 1
		# temporizar isso aqui
	
func decrement_life():
	lifes -= 1
	combo_count = 0
	
func increment_life():
	lifes += 1
	pass
	
func display_score():
	final_score = n_waves * 100 + bonus_counter * 200
	waves_jumped_label.set_text(str(final_score))
	
func check_game_over():
	if lifes <= 0:
		current_action = GAME_OVER