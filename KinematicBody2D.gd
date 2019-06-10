extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const  ACCELERATION = 50
const UP = Vector2(0,-1)
const GRAVITY = 20
const JUMP_FORCE = -500
var motion = Vector2(0,0)
var maxHorizontalSpeed = 120
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var friction = false
	motion.y+=GRAVITY	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION,maxHorizontalSpeed)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION,-maxHorizontalSpeed)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else: 
		$Sprite.play("Idle")
		friction = true 
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_FORCE
		if(friction==true):
			motion.x=lerp(motion.x,0,0.2)		
	else: 
		if(motion.y<0):
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if(friction==true):
			motion.x=lerp(motion.x,0,0.05)	
	motion = move_and_slide(motion,UP)
	pass
