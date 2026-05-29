extends CharacterBody2D

const SPEED = 25.0

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shoot")
	global_position += Vector2.UP * SPEED * delta
