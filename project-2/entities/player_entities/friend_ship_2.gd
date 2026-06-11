extends CharacterBody2D

const SPEED = 15.0
const BULLET = preload("res://entities/player_entities/bullet_1.tscn")
@onready var health = 15

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shoot")
	$Health.value = health
	global_position += Vector2.UP * SPEED * delta
	if global_position.y < -20:
		queue_free()
	var collision = move_and_collide(Vector2.UP * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method('take_damage'):
			collider.take_damage(health)
		take_damage(health)

func _on_timer_timeout() -> void:
	var bullet = BULLET.instantiate()
	bullet.global_position = global_position + Vector2(0, -20)
	get_parent().add_child(bullet)
	$Shoot_sound.play()

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
