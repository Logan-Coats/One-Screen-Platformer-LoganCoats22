extends Node2D



func _ready():
	pass # Replace with function body.




func _on_DeathFloor_body_entered(body):
	$Player.position = $Position2D.position
