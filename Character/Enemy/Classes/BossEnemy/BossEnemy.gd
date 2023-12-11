extends "res://Character/Enemy/Enemy.gd"
class_name BossEnemy

signal victory

var rng = RandomNumberGenerator.new()
var maxIdleLoop = rng.randi_range(1,2)
var idleCount = 0

var attackType
var attackSide
var detected = false # begin once the player is seen
var player
var damage = 50.0

func _ready():
	$healthbar.visible = false
	knockback = 2000
	HP = 300

func _physics_process(delta):
	if(HP <= 0):
		print("1")
		get_tree().change_scene_to_file("res://World/game_over.tscn")
	pass

func IdleCheck():
	if (idleCount < maxIdleLoop):
		$Moves.play("Idle", -1, 0.75, false)
		idleCount += 1
	if(idleCount >= maxIdleLoop):
		idleCount = 0
		maxIdleLoop = rng.randi_range(1,2)
		ChooseAttack()
	pass

func ChooseAttack():
	attackType = rng.randi_range(1,3)
	if(attackType == 1):
		$Moves.play("SpinAttack", 0.5, 1.0, false)
	elif (attackType == 2):
		$Moves.play("LeftSwipe", 0.5, 1.0, false)
	else:
		$Moves.play("RightSwipe",0.5, 1.0, false)
	pass

func _on_detect_player_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		detected = true
		IdleCheck()

func _on_left_hand_body_entered(body):
	if(body.is_in_group("Player")):
		player.velocity = Vector2(knockback,knockback) * global_position.direction_to(player.global_position).normalized()
		player.take_damage(damage)
	pass # Replace with function body.


func _on_right_hand_body_entered(body):
	if(body.is_in_group("Player")):
		player.velocity = Vector2(knockback,knockback) * global_position.direction_to(player.global_position).normalized()
		player.take_damage(damage)
	pass # Replace with function body.


func _on_face_body_entered(body):
	if(body.is_in_group("Player")):
		player.velocity = Vector2(knockback,knockback) * global_position.direction_to(player.global_position).normalized()
		player.take_damage(damage)
