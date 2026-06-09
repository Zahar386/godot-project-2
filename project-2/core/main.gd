extends Node2D

@onready var pl = $Player
@onready var en = $Enemy

func _physics_process(delta: float) -> void:
	if pl.is_queued_for_deletion() == false:
		if pl.health <= 0:
			$Music.stream_paused = true
			pl.queue_free()
			en.queue_free()
			$Walls.queue_free()
		
		$Walls/Level.text = "Level: "+str(en.level+1)
		$Walls/Metall.text = str(GameManager.metall)
		$Walls/Energy.text = str(2-GameManager.energy)
		
		if pl.global_position.x > en.global_position.x:
			en.global_position.x += en.SPEED*delta
		if pl.global_position.x < en.global_position.x:
			en.global_position.x -= en.SPEED*delta
		
		if $Background.region_rect.position.y < 64:
			$Background.region_rect.position.y += 0.33
		else:
			$Background.region_rect.position.y = 0
	else:
		pass
