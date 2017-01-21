extends AnimatedSprite

const LOW = 0
const MED = 1
const HIGH = 2

func jump(height):
	var animPlayer = get_node("MeniniPlayer")
	if (height == LOW):
		animPlayer.play("lowjump")
	elif(height == MED):
		animPlayer.play("mediumjump")
	elif(height == HIGH):
		animPlayer.play("highjump")
	else :
		animPlayer.play("lowjump")
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
