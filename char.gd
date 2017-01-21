extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func jump(height):
	var animPlayer = get_node("AnimationPlayer")
	animPlayer.play("highjump")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
