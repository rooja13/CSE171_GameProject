extends Node2D

@export var rangedplayer: RangedPlayer
@export var ui: UI

# Called when the node enters the scene tree for the first time.
func _ready():
	#if !rangedplayer.hurt.is_connected(ui._on_take_damage):
	#	rangedplayer.hurt.connect(ui._on_take_damage)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
