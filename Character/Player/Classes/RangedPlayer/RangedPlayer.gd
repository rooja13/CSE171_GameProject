extends "res://Character/Player/Player.gd"

class_name RangedPlayer

signal hurt(damage_taken)

# Normal attack
var attack_speed = 2.0			# Attack speed in seconds
var attack_lock = 2.0		
@export var attack_count = 0
var special_attack = 10
var special_kb = 500

# Skill
var skill_cd = 20.0
var skill_aspd = 0.5
var skill_count = 20.0
var skill_duration = 5.0
var duration_count = 0.0
var aspd_hold = 0.0
 
var Projectile = preload("res://Character/Player/Classes/RangedPlayer/Projectile.tscn")
var SpecialProjectile = preload("res://Character/Player/Classes/RangedPlayer/special_projectile.tscn")
	
func _physics_process(delta):
	movement(delta)
	
	# Shoot projectile
	attack_lock += delta
	if Input.is_action_just_pressed("shoot") && attack_lock >= attack_speed:
		if attack_count == special_attack:
			special()
			attack_count = 0
		else:
			shoot()
		attack_count += 1
		attack_lock = 0
	
	# Skill
	skill_count += delta
	if Input.is_action_just_pressed("skill") && skill_count >= skill_cd:
		aspd_hold = attack_speed
		attack_speed = skill_aspd
		duration_count += delta
		if duration_count >= skill_duration:
			skill_count = 0
			duration_count = 0
			attack_speed = aspd_hold

# Makes instance of projectile in the world scene
func shoot():
	var projectile_instance = Projectile.instantiate()
	owner.add_child(projectile_instance)
	projectile_instance.global_transform = $Marker2D.get_global_transform()
	projectile_instance.get_node("Area2D").set_look_direction(look_direction)
	take_damage(10)

# Makes instance of special projectile in the world scene
func special():
	var special_instance = SpecialProjectile.instantiate()
	owner.add_child(special_instance)
	special_instance.global_transform = $Marker2D.get_global_transform()
	special_instance.get_node("Area2D").set_look_direction(look_direction)
	velocity.x = -special_kb * look_direction
	
func take_damage(damage_taken):
	hurt.emit(damage_taken)
