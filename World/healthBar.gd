extends ProgressBar

@export var rangedPlayer: RangedPlayer

func _ready():
	#player.HP_changed.connect(update)
	update()

func update():
	value = player.HP
