extends Node2D

func _physics_process(delta: float) -> void:
	if $Player.is_queued_for_deletion() == false:
		if $Player.health <= 0:
			$Music.stream_paused = true
			$Player.queue_free()
			$Enemy.queue_free()
			$Walls.queue_free()
		
		$Walls/Level.text = "Level: "+str($Enemy.level+1)
		$Enemy/Health.value = $Enemy.health
		$Walls/Metall.text = str($Player.metall)
		
		if $Player.global_position.x > $Enemy.global_position.x:
			$Enemy.global_position.x += $Enemy.SPEED*delta
		if $Player.global_position.x < $Enemy.global_position.x:
			$Enemy.global_position.x -= $Enemy.SPEED*delta
		
		if $Background.region_rect.position.y < 64:
			$Background.region_rect.position.y += 0.33
		else:
			$Background.region_rect.position.y = 0
	else:
		pass
