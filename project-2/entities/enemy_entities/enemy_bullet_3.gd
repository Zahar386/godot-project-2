extends CharacterBody2D

const SPEED = 80.0

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		rotation_degrees -= 0.2
		global_position += Vector2.DOWN.rotated(global_rotation)*delta*SPEED
		if global_position.y > 276 or global_position.y < -20:
			queue_free()
		var collision = move_and_collide(Vector2.DOWN.rotated(global_rotation)*delta*SPEED)
		if collision:
			var collider = collision.get_collider()
			rotation_degrees += randi_range(170,190)
			if collider.has_method('take_damage'):
				collider.take_damage(4)
				if global_position.y <= 50:
					collider.take_damage(-4)
			$Give_damage.play()
	else:
		queue_free()
