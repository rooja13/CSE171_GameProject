extends CharacterBody2D

class_name Character

var SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ACCELERATION = 75.0
var FRICTION = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var HP = 100

enum STATES {IDLE, RUN, ATTACK, STAGGER, DEAD}
var current_state = STATES.IDLE
var previous_state = null

# State machine
func change_state(new_state):
	previous_state = current_state
	current_state = new_state
	
	match current_state:
		STATES.DEAD:
			queue_free()

func take_damage(damage):
	HP -= damage
	if HP <= 0:
		change_state(STATES.DEAD)
	else:
		change_state(STATES.STAGGER)
