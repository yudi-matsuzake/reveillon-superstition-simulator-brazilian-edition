extends Node2D

signal game_over

var wave_flowing = false
var wave
var viewport_rect
var life_counter = 3
	
func start_wave():
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
		pressed_wrong_key()
	
	if (event.is_action_released("jump")):
		get_node("Menini").jump(get_node("Menini").MED)
	
func pressed_wrong_key():
	lost_a_life()
	
func pressed_correct_key():
	print("CORRECT KEY PRESSED")
	
func lost_a_life():
	if ( life_counter > 0 and life_counter <=3 ):
		get_node("LifeMeter/L" + str(life_counter)).set_frame(1)
		life_counter -= 1
		
	if life_counter == 0:
		emit_signal("game_over")

func got_a_life():
	if ( life_counter < 3 ):
		life_counter += 1
		get_node("LifeMeter/L" + str(life_counter)).set_frame(0)
	
func jumpwave():
	var tween = get_node("Tween")
	var wave = get_node("Wave")
	get_node("Wave/WaveAnimation").stop(false)
	# tween.targeting_property(wave, "transform/pos", wave, "transform/pos", Vector2(-200, wave.get_pos().y), 1, tween.TRANS_LINEAR, 2)
	# tween.start()
	var menini_player = get_node("Menini/MeniniPlayer")
	menini_player.set_speed(2)
	menini_player.play("highjump")
	
func _ready():
	wave = get_node("Wave")
	viewport_rect = get_viewport_rect()
	set_process(true)
	set_process_input(true)

func _on_WaveAnimation_finished():
	get_node("WaveAnimation").seek(0, true)
