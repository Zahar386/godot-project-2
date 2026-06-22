extends CharacterBody2D

const SPEED = 80.0

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		global_position += Vector2.UP*delta*SPEED
		if global_position.y < -20:
			queue_free()
		var collision = move_and_collide(Vector2.UP * SPEED * delta)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method('take_damage'):
				if global_position.y <= 50:
					if GameManager.friend_ship_level_3 >= 2:
						collider.SPEED -= 0.2
						collider.debuff += 0.2
					else:
						collider.SPEED -= 0.1
						collider.debuff += 0.1
					if collider.debuff > 9.9 and collider.debuff < 10:
						collider.debuff = 10
				if GameManager.friend_ship_level_3 >= 1:
					collider.take_damage(1)
				else:
					collider.take_damage(0.5)
			queue_free()
	else:
		queue_free()
