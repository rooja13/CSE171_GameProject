extends Area2D

var SPEED = 600.0
@export var damage = 20.0

func _physics_process(delta):
	position.x += SPEED * delta

# Set projectile to spawn in the direction of the player's look direction*
func set_look_direction(look_direction):
	SPEED = SPEED * look_direction

# Clear scene after it hits a body
func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage(damage)
		queue_free()

# Clear scene after it goes out of camera
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
