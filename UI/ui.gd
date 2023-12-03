extends CanvasLayer
class_name UI

@onready var health_label = %Health

var health = 100:
	set(new_health):
		health = new_health
		_update_health_label()

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_health_label()
	
func _update_health_label():
	health_label.text = str(health)

func _on_take_damage(damage_taken) -> void:
	health -= damage_taken
