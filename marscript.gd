extends AnimationPlayer

var backwards = false
func _ready():
	pass

func _on_OndasPlayer_finished():
	if backwards :
		self.play("movimento")
		backwards = false
	else :
		self.play_backwards("movimento")
		backwards = true
