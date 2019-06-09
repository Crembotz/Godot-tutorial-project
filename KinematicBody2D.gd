extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const UP = Vector2(0,-1)
const GRAVITY = 20
const JUMP_FORCE = -500
var motion = Vector2(0,0)
var horizontalSpeed = 120
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y+=GRAVITY	
	if Input.is_action_pressed("ui_right"):
		motion.x = horizontalSpeed
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -horizontalSpeed
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else: 
		motion.x=0
		$Sprite.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_FORCE
	else: 
		$Sprite.play("Jump")	
	motion = move_and_slide(motion,UP)
	pass
