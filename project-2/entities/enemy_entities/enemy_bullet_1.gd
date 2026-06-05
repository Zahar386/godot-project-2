extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	global_position += Vector2.DOWN*delta*SPEED
	if global_position.y < -20:
		queue_free()
	var collision = move_and_collide(Vector2.DOWN * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method('take_damage'):
			collider.take_damage(10)
			if collider == $'.':
				queue_free()
