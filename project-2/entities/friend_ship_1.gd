extends CharacterBody2D

const SPEED = 15.0
const BULLET = preload("res://entities/bullet_1.tscn")
@onready var health = 10

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shoot")
	global_position += Vector2.UP * SPEED * delta
	if global_position.y < -20:
		queue_free()
	self_modulate.a = health*10

func _on_timer_timeout() -> void:
	var bullet1 = BULLET.instantiate()
	bullet1.global_position = global_position + Vector2(0, -10)
	get_parent().add_child(bullet1)

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
