extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		global_position += Vector2.DOWN.rotated(global_rotation)*delta*SPEED
		if global_position.y > 276:
			queue_free()
		var collision = move_and_collide(Vector2.DOWN.rotated(global_rotation)*delta*SPEED)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method('take_damage'):
				collider.poison_value += 7
				queue_free()
	else:
		queue_free()
