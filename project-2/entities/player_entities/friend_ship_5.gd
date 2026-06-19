extends CharacterBody2D

@onready var SPEED = 60.0
@onready var damage = GameManager.metall

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		$AnimatedSprite2D.play("shoot")
		global_position += Vector2.UP * SPEED * delta
		if global_position.y < -20:
			queue_free()
		var collision = move_and_collide(Vector2.UP * SPEED * delta)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method('take_damage'):
				GameManager.energy -= float(damage*0.01)
				if GameManager.friend_ship_level_5 >= 1:
					collider.take_damage(float(damage*0.1))
				else:
					collider.take_damage(0)
				if GameManager.friend_ship_level_5 >= 3:
					GameManager.metall -= 30
				else:
					GameManager.metall = 0
				if GameManager.friend_ship_level_5 == 4:
					if SPEED > 3:
						collider.SPEED -= 3
						collider.debuff += 3
			queue_free()
	else:
		queue_free()
