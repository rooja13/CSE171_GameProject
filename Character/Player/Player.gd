extends "res://Character/Character.gd"

class_name Player

func _physics_process(delta):
	movement(delta)

func movement(delta):
	# Implements gravity
	velocity.y += gravity * delta
	
	# Implements horizontal movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = min(velocity.x + ACCELERATION, SPEED)
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = max(velocity.x - ACCELERATION, -SPEED)
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
	else:
		FRICTION = true
		$AnimatedSprite2D.play("idle")
		
	# Implements vertical motion
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY
		if FRICTION == true:
			velocity.x = lerp(velocity.x, 0.0, 0.2)
	else:
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		else:
			$AnimatedSprite2D.play("fall")

		if FRICTION == true:
			velocity.x = lerp(velocity.x, 0.0, 0.05)
	
	move_and_slide()
