extends CharacterBody2D

const PLAYER = preload("res://entities/player_entities/player.tscn")
const SPEED = 100.0
@onready var health = 10

func _physics_process(delta: float) -> void:
	global_position += Vector2.DOWN*delta*SPEED
	if global_position.y > 276:
		queue_free()
	var collision = move_and_collide(Vector2.DOWN * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method('take_damage'):
			collider.take_damage(30)
			if global_position.y >= 240-28:
				queue_free()

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
