extends CharacterBody2D

@onready var SPEED = 15.0
@onready var health = 50
@onready var level = 0
@onready var poison_value = 0
const BULLET = preload("res://entities/enemy_entities/enemy_bullet_1.tscn")

func take_damage(damage):
	$Sound_effects.play()
	health -= damage
	if health <= 0:
		level += 1
		if randi_range(0,1) == 0:
			global_position.x = -34
		else:
			global_position.x = 290
		health = 50+(level*5)
		$Sprite2D.self_modulate.g8 -= level*2
		$Sprite2D.self_modulate.b8 -= level*2
		SPEED += 1
		$Health.max_value = health
		$Wait_for_shooting.max_value = 30-SPEED+1
		$Timer.start(30-SPEED)
		GameManager.money += 1

func _physics_process(delta: float) -> void:
	$Wait_for_shooting.value = $Timer.wait_time - $Timer.time_left
	$Health.value = health
	global_position.y = 24
	if poison_value > 0:
		$Rust.visible = true
		$Poison_value.visible = true
		$Poison_value.text = str(poison_value)
		$Health.self_modulate = Color("00ff00ff")
	else:
		$Rust.visible = false
		$Poison_value.visible = false
		$Poison_value.text = str(poison_value)
		$Health.self_modulate = Color("ff0000ff")

func _on_timer_timeout() -> void:
	var bullet1 = BULLET.instantiate()
	bullet1.global_position = global_position + Vector2(0, 20)
	get_parent().add_child(bullet1)

func _on_poison_timer_timeout() -> void:
	if poison_value > 0:
		take_damage(1)
		poison_value -= 1
