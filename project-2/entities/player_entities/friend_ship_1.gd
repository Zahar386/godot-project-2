extends CharacterBody2D

const SPEED = 10.0
const BULLET = preload("res://entities/player_entities/bullet_1.tscn")
const dead_sound = preload("res://assets/fnaf-world-death-sound-made-with-Voicemod.mp3")
const shoot_sound = preload("res://assets/Attack1.ogg")
@onready var health = 10

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shoot")
	$Health.value = health
	global_position += Vector2.UP * SPEED * delta
	if global_position.y < -20:
		queue_free()
	self_modulate.a = health*10
	var collision = move_and_collide(Vector2.UP * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method('take_damage'):
			collider.take_damage(3)
			take_damage(10)

func _on_timer_timeout() -> void:
	var bullet1 = BULLET.instantiate()
	bullet1.global_position = global_position + Vector2(0, -10)
	get_parent().add_child(bullet1)
	$Sound_effects.stream = shoot_sound
	$Sound_effects.play()

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
