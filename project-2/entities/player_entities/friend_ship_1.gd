extends CharacterBody2D

const SPEED = 5.0
const dead_sound = preload("res://assets/fnaf-world-death-sound-made-with-Voicemod.mp3")
const shoot_sound = preload("res://assets/Attack1.ogg")
@onready var health = 25

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shoot")
	$Health.value = health
	global_position += Vector2.UP * SPEED * delta
	if global_position.y < -20:
		GameManager.metall += 5
		queue_free()
	self_modulate.a = health*10
	var collision = move_and_collide(Vector2.UP * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method('take_damage'):
			collider.take_damage(10)
		take_damage(health)

func _on_timer_timeout() -> void:
	GameManager.metall += 1
	$Sound_effects.stream = shoot_sound
	$Sound_effects.play()

func take_damage(damage):
	health -= damage
	GameManager.metall += round(damage/2)
	if health <= 0:
		$Sound_effects.stream = dead_sound
		$Sound_effects.play()
		queue_free()
