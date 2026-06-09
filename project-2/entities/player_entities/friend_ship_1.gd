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
		take_damage(health)
	self_modulate.a = health*10
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
	global_position += Vector2(0, 5)
	$Sound_effects.stream = shoot_sound
	$Sound_effects.play()
	

func take_damage(damage):
	health -= damage
	GameManager.metall += round(damage/2)
	if health <= 0:
		$Sound_effects.stream = dead_sound
		$Sound_effects.play()
		queue_free()
