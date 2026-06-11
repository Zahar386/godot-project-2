extends CharacterBody2D

const SPEED = 15.0
const BULLET = preload("res://entities/player_entities/bullet_2.tscn")
@onready var num_gun = 0
@onready var health = 15

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shoot")
	$Health.value = health
	global_position += Vector2.UP * SPEED * delta
	if global_position.y < -20:
		take_damage(health)
	var collision = move_and_collide(Vector2.UP * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method('take_damage'):
			collider.take_damage(health)
		take_damage(health)

func _on_timer_timeout() -> void:
	var bullet = BULLET.instantiate()
	if num_gun == 0:
		bullet.global_position = global_position + Vector2(5, -8)
		num_gun = 1
	elif num_gun == 1:
		bullet.global_position = global_position + Vector2(-5, -8)
		num_gun = 0
	get_parent().add_child(bullet)
	$Shoot_sound.play()

func take_damage(damage):
	health -= damage
	GameManager.metall += round(damage/2)
	if health <= 0:
		queue_free()
