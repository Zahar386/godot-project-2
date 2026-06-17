extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		global_position += Vector2.UP*delta*SPEED
		if global_position.y < -20:
			queue_free()
		var collision = move_and_collide(Vector2.UP * SPEED * delta)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method('take_damage'):
				if GameManager.friend_ship_level_2 >= 1:
					collider.take_damage(1)
				else:
					collider.take_damage(2)
				if GameManager.friend_ship_level_2 >= 2:
					collider.poison_value += 3
				else:
					collider.poison_value += 2
				if GameManager.friend_ship_level_2 == 4:
					GameManager.metall += 1
			queue_free()
	else:
		queue_free()
