extends CharacterBody2D

@onready var SPEED = 6
@onready var health = 10
@onready var direction = Vector2.RIGHT
@onready var poison_value = 0

func _ready() -> void:
	var choose = randi() % 2
	if choose == 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT
	
	if GameManager.friend_ship_level_4 >= 1:
		health += 10
		$Health.max_value = 20
	if GameManager.friend_ship_level_4 == 4:
		$Timer.start(1)

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		if poison_value > 0:
			$Health.self_modulate = Color("00ff00ff")
		else:
			$Health.self_modulate = Color("ff0000ff")
		$AnimatedSprite2D.play("shoot")
		$Health.value = health
		global_position += direction * SPEED * delta
		if global_position.y < -20:
			take_damage(health)
		
		if int(global_position.x) == 230:
			direction = Vector2.LEFT
		elif int(global_position.x) == 25:
			direction = Vector2.RIGHT
		
		var collision = move_and_collide(Vector2.UP * (SPEED/2) * delta)
		if collision:
			var collider = collision.get_collider()
			if collider.has_method('take_damage'):
				collider.take_damage(health)
				take_damage(health)
	else:
		queue_free()

func _on_timer_timeout() -> void:
	give_metall()
	$Shoot_sound.play()

func take_damage(damage):
	health -= damage
	GameManager.metall += round(damage/2)
	$Get_damage.play()
	if health <= 0:
		queue_free()

func give_metall():
	if GameManager.metall < 99:
		if GameManager.friend_ship_level_4 >= 2:
			GameManager.metall += 1
		GameManager.metall += 1
	else:
		GameManager.metall = 99

func _on_poison_timer_timeout() -> void:
	if poison_value > 0:
		take_damage(1)
		poison_value -= 1
