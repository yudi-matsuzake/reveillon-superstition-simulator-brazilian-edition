extends Node2D

signal game_over

const COMBO_TEXT = "COMBO +7"

var wave_flowing = false
var wave
var viewport_rect
var life_counter = 3

func start_wave():
	var animPlayer = get_node("Wave/WaveAnimation").play("waveflow")
		
func bonus_arrived():
	get_node("bonus_text/BonusTextPlayer").play("blink")
	
func give_bonus(bonus):
	get_node("bonus_text").set_text(bonus.pre_text + "\n" + bonus.text)
	get_node("bonus").set_texture(bonus.texture)
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
	pass

	
func lost_a_life():
	if ( life_counter > 0 and life_counter <=3 ):
		get_node("LifeMeter/L" + str(life_counter)).set_frame(1)
		life_counter -= 1
		get_node("Wave/WaveAnimation").play("waveflow")
		get_node("Menini/MeniniPlayer").play("pain")
	
	get_node("combo_text").set_text("")
	
	if life_counter == 0:
		emit_signal("game_over")

func got_a_life():
	if ( life_counter < 3 ):
		life_counter += 1
		get_node("LifeMeter/L" + str(life_counter)).set_frame(0)
	
func jumpwave(time, combo_count):
	var menini_player = get_node("Menini/MeniniPlayer")
	update_combo_display(combo_count)
	speed_wave(time)
	menini_player.set_speed(2 / time)
	menini_player.play("highjump")

func update_combo_display(combo_count):
	var combo_text_label = get_node("combo_text")
	combo_text_label.set_text("COMBO " + str(combo_count));
	if combo_count % 7 == 0 :
		get_node("combo_text/ComboTextPlayer").play("blink")
	
func got_hit_by_wave(time):
	lost_a_life()
	speed_wave(time)
	
func speed_wave(time):
	var tween = get_node("Tween")
	get_node("Wave/WaveAnimation").stop(false)
	tween.targeting_property(wave, "transform/pos", wave, "transform/pos", Vector2(-50, 400), time, tween.TRANS_LINEAR, 2)
	tween.start()
	
func _ready():
	wave = get_node("Wave")
	viewport_rect = get_viewport_rect()
	set_process(true)
	set_process_input(true)

func _on_WaveAnimation_finished():
	get_node("WaveAnimation").seek(0, true)

func _on_BonusPlayer_finished():
	get_node("bonus/BonusPlayer").seek(0, true)
	bonus_arrived()

func _on_BonusTextPlayer_finished():
	get_node("bonus_text").set_text("")
	# sometimes animation will not set self opacity to 0
	get_node("bonus_text").set_self_opacity(0)
