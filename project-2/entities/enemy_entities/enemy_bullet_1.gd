extends CharacterBody2D

const SPEED = 120.0

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		global_position += Vector2.DOWN*delta*SPEED
		$GPUParticles2D.rotation_degrees = randi_range(165,195)
		if global_position.y > 306:
			queue_free()
		var collision = move_and_collide(Vector2.DOWN * SPEED * delta)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method('take_damage'):
				collider.take_damage(10)
				if global_position.y >= 240-28:
					collider.take_damage(20)
					queue_free()
				if collider.has_method("give_metall"):
					queue_free()
	else:
		queue_free()
