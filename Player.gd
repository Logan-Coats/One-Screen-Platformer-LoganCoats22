extends KinematicBody2D

export var gravity = 200
export var max_speed = 350
export var acceleration =200
export var friction = 900
#export var jump = 400
export var fallMultiplier = .01
export var lowJumpMultiplier = 10
export var jumpVelocity = 200



onready var anim = $AnimatedSprite
var velocity = Vector2.ZERO

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = move_toward(velocity.x,max_speed,acceleration*delta)
		anim.play('run')
		
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = move_toward(velocity.x, -max_speed,acceleration*delta)
		anim.play('run')
		if Input.is_action_pressed("ui_left"):
			#anim.rotation_degrees(180)
			anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x,0,friction*delta)
		anim.play('idle')
	if not is_on_floor():
		
		anim.play('jump')

func _physics_process(delta):
	velocity.y += gravity*delta
	velocity = move_and_slide(velocity,Vector2.UP)
	
	if velocity.y > 0: #Player is falling
		velocity += Vector2.UP * (-9.81) * (fallMultiplier) #Falling action is faster than jumping action | Like in mario
	elif velocity.y < 0 && Input.is_action_just_released("ui_accept"): #Player is jumping 
		velocity += Vector2.UP * (-9.81) * (lowJumpMultiplier) #Jump Height depends on how long you will hold key
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"): 
			velocity = Vector2.UP * jumpVelocity #Normal Jump action
	velocity = move_and_slide(velocity, Vector2(0,-1))  
	
	
