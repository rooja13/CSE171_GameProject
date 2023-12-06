extends "res://Character/Enemy/Enemy.gd"

var speed = 150
var seePlayer = false
var player = null

func _physics_process(delta):
	if seePlayer:
		velocity.x = global_position.direction_to(player.global_position).x * speed
		#velocity = global_position.direction_to(player.global_position) * SPEED
		move_and_slide()
		


func _on_detect_player_2_body_entered(body):
	print(body.get_parent().get_name())
	if(body.get_parent().get_name() == "Player"or
	body.get_parent().get_name() == "RangedPlayer"):
		seePlayer = true
		player = body

func _on_detect_player_2_body_exited(body):
	if(body.get_parent().get_name() == "Player" or
	body.get_parent().get_name() == "RangedPlayer"):
		seePlayer = false
		player = null
	pass
