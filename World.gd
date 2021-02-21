extends Node2D
func _ready():
	$Goal/AnimatedSprite.play('idle')
func _on_DeathFloor_body_entered(body ):
	$Player.position = $Position2D.position


func _on_Goal_body_entered(body):
	$Goal/AnimatedSprite.play('opening')
	$Player.visible = false
	$Player.position = $Position2D.position
	$Label.visible = true
	$Button.visible = true


func _on_Button_pressed():
	$Goal/AnimatedSprite.play('closing')
	$Player.visible = true
	$Label.visible = false
	$Button.visible = false
