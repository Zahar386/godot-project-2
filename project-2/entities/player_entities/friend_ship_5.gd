extends CharacterBody2D

const SPEED = 60.0
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
				collider.take_damage(float(damage*0.1))
				GameManager.energy -= float(damage*0.01)
				GameManager.metall = 0
			queue_free()
	else:
		queue_free()
