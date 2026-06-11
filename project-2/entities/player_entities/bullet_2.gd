extends CharacterBody2D

const SPEED = 80.0

func _physics_process(delta: float) -> void:
	global_position += Vector2.UP*delta*SPEED
	if global_position.y < -20:
		queue_free()
	var collision = move_and_collide(Vector2.UP * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method('take_damage'):
			if global_position.y <= 50 and is_queued_for_deletion() == false:
				if collider.SPEED > 5:
					collider.SPEED -= 0.1
			collider.take_damage(1)
		queue_free()
