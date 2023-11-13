extends "res://Character/Player/Player.gd"

class_name RangedPlayer

var attack_speed = 2			# Attack speed in seconds
var attack_lock = 2				
 
var Projectile = preload("res://Character/Player/Classes/RangedPlayer/Projectile.tscn")
	
func _physics_process(delta):
	movement(delta)
	
	# Shoot projectile
	attack_lock += delta
	if Input.is_action_just_pressed("shoot") && attack_lock >= attack_speed:
		shoot()
		attack_lock = 0

# Makes of instance of projectile in the world scene
func shoot():
	var projectile_instance = Projectile.instantiate()
	owner.add_child(projectile_instance)
	projectile_instance.transform = $Marker2D.get_global_transform()
	projectile_instance.get_node("Area2D").set_look_direction(look_direction)
