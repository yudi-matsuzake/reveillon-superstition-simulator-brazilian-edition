extends Node2D

var wave_flowing = false
var time_limit
var wave
var viewport_rect
var life_counter = 3
	
func start_wave(time):
	wave_flowing = true
	time_limit = time
	var animPlayer = get_node("Wave/WaveAnimation").play("waveflow")
		
func give_bonus():
	var animPlayer = get_node("bonus/BonusPlayer").play("floatbonus")
	
func _process(delta):
	pass

func _input(event):
	if (event.is_action_pressed("lose_life")):
		lost_a_life()
		
	if (event.is_action_released("start_wave")):
		start_wave(3)
		
	if (event.is_action_pressed("give_bonus")):
		give_bonus()
	
	if (event.is_action_released("jump")):
		get_node("Menini").jump(get_node("Menini").MED)
	
func pressed_wrong_key():
	var wavePlayer = get_node("WaveAnimation").stop()
	
func lost_a_life():
	if ( life_counter > 0 and life_counter <=3 ):
		get_node("LifeMeter/L" + str(life_counter)).set_frame(1)
		life_counter -= 1

func got_a_life():
	if ( life_counter < 3 ):
		life_counter += 1
		get_node("LifeMeter/L" + str(life_counter)).set_frame(0)
	
func _ready():
	wave = get_node("Wave")
	viewport_rect = get_viewport_rect()
	set_process(true)
	set_process_input(true)

func _on_WaveAnimation_finished():
	get_node("WaveAnimation").seek(0, true)
