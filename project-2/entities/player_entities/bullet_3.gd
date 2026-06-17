extends CharacterBody2D

const SPEED = 110.0

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		global_position += Vector2.UP*delta*SPEED
		if global_position.y < -20:
			queue_free()
		var collision = move_and_collide(Vector2.UP * SPEED * delta)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method('take_damage'):
				collider.take_damage(2)
				if GameManager.energy > 1:
					if GameManager.friend_ship_level_1 >= 2:
						GameManager.energy -= 0.02
					else:
						GameManager.energy -= 0.01
				if GameManager.friend_ship_level_1 == 4:
					collider.poison_value += 1
			queue_free()
	else:
		queue_free()
