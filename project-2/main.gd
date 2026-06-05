extends Node2D

func _physics_process(delta: float) -> void:
	$Level.text = "Level: "+str($Enemy.level+1)
	$Enemy/Health.value = $Enemy.health
	
	if $Player.global_position.x > $Enemy.global_position.x:
		$Enemy.global_position.x += $Enemy.SPEED*delta
	if $Player.global_position.x < $Enemy.global_position.x:
		$Enemy.global_position.x -= $Enemy.SPEED*delta
	
	if $Background.region_rect.position.y < 64:
		$Background.region_rect.position.y += 0.3
	else:
		$Background.region_rect.position.y = 0
	
