extends CharacterBody2D

const dead_sound = preload("res://assets/fnaf-world-death-sound-made-with-Voicemod.mp3")
const shoot_sound = preload("res://assets/gamingsins-ding-sonic-ring.mp3")
@onready var health = 25
@onready var direction = Vector2.RIGHT

func _ready() -> void:
	var choose = randi() % 2
	print(choose)
	if choose == 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT
func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("shoot")
	$Health.value = health
	global_position += direction * 5 * delta
	if global_position.y < -20:
		take_damage(health)
	
	if int(global_position.x) == 230:
		direction = Vector2.LEFT
	elif int(global_position.x) == 25:
		direction = Vector2.RIGHT
	
	self_modulate.a = health*10
	var collision = move_and_collide(Vector2.UP * 2 * delta)
	if collision:
		var collider = collision.get_collider()
		collider.queue_free()
		take_damage(health)

func _on_timer_timeout() -> void:
	give_metall()

func take_damage(damage):
	health -= damage
	GameManager.metall += round(damage/2)
	if health <= 0:
		$Sound_effects.stream = dead_sound
		$Sound_effects.play()
		queue_free()

func give_metall():
	GameManager.metall += 1
	$Sound_effects.stream = shoot_sound
	$Sound_effects.play()
