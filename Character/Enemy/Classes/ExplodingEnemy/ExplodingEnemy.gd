extends "res://Character/Enemy/Enemy.gd"

class_name ExplodingEnemy

var player
var player_inner

var detect_inner = false
var explode = 3.0			# Time before explosion in seconds
var explode_count = 0.0		# Explosion counter
var damage = 50.0
 
func _ready():
	SPEED = 100.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Enemy moves towards player when detected
	if player && detect_inner == false:
		velocity = global_position.direction_to(player.global_position) * SPEED
		move_and_slide()
	
	# When enemy gets close enough, start a timer to count down until explosion
	if detect_inner == true:
		explode_count += delta
		if explode_count >= explode:
			if player_inner:
				player_inner.take_damage(damage)
			queue_free()

func _on_detect_player_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_detect_player_body_exited(body):
	if body.is_in_group("Player"):
		player = null

func _on_detect_inner_body_entered(body):
	if body.is_in_group("Player"):
		detect_inner = true
		player_inner = body

func _on_detect_inner_body_exited(body):
	if body.is_in_group("Player"):
		detect_inner = false
		player_inner = null
