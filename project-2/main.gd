extends Node2D

func _physics_process(delta: float) -> void:
	$Enemy/Health.value = $Enemy.health
	if $Player.global_position.x > $Enemy.global_position.x:
		$Enemy.global_position.x += $Enemy.SPEED*delta
	if $Player.global_position.x < $Enemy.global_position.x:
		$Enemy.global_position.x -= $Enemy.SPEED*delta
