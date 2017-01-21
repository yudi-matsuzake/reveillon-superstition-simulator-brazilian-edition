extends Sprite

var N_KEY = 0
var key
var gamepad

var textures = []
var button_textures = [ preload("res://img/thinking_button_d.png"),
						preload("res://img/thinking_button_f.png"),
						preload("res://img/thinking_button_j.png"),
						preload("res://img/thinking_button_k.png") ]

func init(key, gamepad=false):
	self.key = key
	self.gamepad = gamepad

	change_texture_to_key()

func _ready():
	pass

func change_texture_to_key():
	set_texture(button_textures[key])

func get_key():
	return key