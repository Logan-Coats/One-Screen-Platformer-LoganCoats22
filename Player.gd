extends KinematicBody2D

export var gravity = 200
export var max_speed = 350
export var acceleration =200
export var friction = 900
export var jump = 400

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
		anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x,0,friction*delta)
		anim.play('idle')
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y += -jump
	if not is_on_floor():
		anim.play('jump')

func _physics_process(delta):
	velocity.y += gravity*delta
	velocity = move_and_slide(velocity,Vector2.UP)
