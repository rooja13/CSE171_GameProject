extends Enemy

class_name BossEnemy

var rng = RandomNumberGenerator.new()
var maxIdleLoop = rng.randi_range(1,3)
var idleCount = 0

var attackType
var attackSide

func _ready():
	print(maxIdleLoop)
	$AnimationPlayer.play("Idle", -1, 1, false)
	$AnimatedSprite2D.play("Idle", 1.0, false)
	$LeftHand/AnimatedSprite2D.play("Attack", 1.0, false)
	$RightHand/AnimatedSprite2D.play("Attack", 1.0, false)
	pass

func _process(delta):
	pass

func IdleCheck():
	
	if (idleCount < maxIdleLoop):
		$AnimationPlayer.play("Idle", -1, 1, false)
		idleCount += 1
	if(idleCount >= maxIdleLoop):
		idleCount = 0
		maxIdleLoop = rng.randi_range(1,3)
		prepAttack()
	pass

func chooseAttack():
	# 1 is Smash, 2 is Swipe
	attackType = rng.randi_range(1,2)
	# 1 is Left, 2 is Right
	attackSide = rng.randi_range(1,2)
	if(attackType == 1):
		if(attackSide == 1):
			$AnimationPlayer.play("LeftShake", -1, 1.0, false)
		else:
			$AnimationPlayer.play("RightShake", -1, 1.0, false)
	else:
		if(attackSide == 1):
			$AnimationPlayer.play("LeftSwipe", -1, 1.0, false)
		else:
			$AnimationPlayer.play("RightSwipe", -1, 1.0, false)
	

func prepAttack():
	$AnimationPlayer.play("WindUp", -1, 1.0, false)

func resetAnimation():
	$AnimationPlayer.play("RESET", -1, 1.0, false)

func setLeftSmash():
	$AnimationPlayer.play("LeftSmash", -1, 1.5, false)

func setRightSmash():
	$AnimationPlayer.play("RightSmash", -1, 1.5, false)
