extends CharacterBody2D

@onready var SPEED = 20.0
const BULLET = preload("res://entities/player_entities/bullet_2.tscn")
@onready var num_gun = 0
@onready var health = 5
@onready var poison_value = 0

func _ready() -> void:
	if GameManager.friend_ship_level_3 >= 2:
		health = 10

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		if GameManager.friend_ship_level_3 >= 3:
			SPEED = 10
		if poison_value > 0:
			$Health.self_modulate = Color("00ff00ff")
		else:
			$Health.self_modulate = Color("ff0000ff")
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
	else:
		queue_free()

func _on_timer_timeout() -> void:
	var bullet = BULLET.instantiate()
	if GameManager.metall > 0:
		if GameManager.friend_ship_level_3 == 4:
			var bullet2 = BULLET.instantiate()
			bullet.global_position = global_position + Vector2(5, -5)
			get_parent().add_child(bullet)
			bullet2.global_position = global_position + Vector2(-5, -5)
			get_parent().add_child(bullet2)
			GameManager.metall -= 1
		else:
			if num_gun == 0:
				bullet.global_position = global_position + Vector2(5, -5)
				num_gun = 1
			elif num_gun == 1:
				bullet.global_position = global_position + Vector2(-5, -5)
				num_gun = 0
			get_parent().add_child(bullet)
		GameManager.metall -= 1
		$Shoot_sound.play()

func take_damage(damage):
	health -= damage
	$Get_damage.play()
	GameManager.metall += round(damage/2)
	if health <= 0:
		queue_free()

func _on_poison_timer_timeout() -> void:
	if poison_value > 0:
		take_damage(1)
		poison_value -= 1
