extends CharacterBody2D

@onready var SPEED = 16.0
@onready var debuff = 0
@onready var health = 50
@onready var level = 0
@onready var poison_value = 0
const BULLET1 = preload("res://entities/enemy_entities/enemy_bullet_1.tscn")
const BULLET2 = preload("res://entities/enemy_entities/enemy_bullet_2.tscn")
const BULLET3 = preload("res://entities/enemy_entities/enemy_bullet_3.tscn")

func take_damage(damage):
	$Sound_effects.stream = load("res://assets/Megabit.ogg")
	$Sound_effects.play()
	health -= damage
	if health <= 0.0:
		level += 1
		if randi_range(0,1) == 0:
			global_position.x = -34
		else:
			global_position.x = 290
		health = 50+(level*5)
		$Sprite2D.self_modulate.g8 -= level*2
		$Sprite2D.self_modulate.b8 -= level*2
		SPEED += level
		debuff -= level
		if debuff < 0:
			debuff = 0
		$Health.max_value = health
		$Timer.start($Wait_for_shooting.max_value)
		if GameManager.money < 99:
			GameManager.money += 1
		if GameManager.high_score <= level:
			GameManager.high_score = level
		GameManager.energy -= 0.1
		GameManager.metall += 10

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
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
			$Health.self_modulate = Color("ff0000ff")
		
		if debuff > 0:
			$Energy_debuff.visible = true
			$Debuff_value.visible = true
			$Debuff_value.text = str(debuff)
		else:
			$Energy_debuff.visible = false
			$Debuff_value.visible = false
		
		if SPEED < 5:
			SPEED = 5
			debuff = 11

func _on_timer_timeout() -> void:
	$Timer.stop()
	for i in range(0,int((level+3)/3)):
		var result = randi_range(0,3)
		if result == 0:
			$Sound_effects.stream = load("res://assets/fnaf-world-death-sound-made-with-Voicemod.mp3")
			$Sound_effects.play()
			var bullet1 = BULLET1.instantiate()
			bullet1.global_position = global_position + Vector2(0, 20)
			get_parent().add_child(bullet1)
		elif result == 1:
			$Sound_effects.stream = load("res://assets/Badpizzawheel.ogg")
			$Sound_effects.play()
			for s in range(-50,50,10):
				var bullet2 = BULLET2.instantiate()
				bullet2.global_position = global_position + Vector2(0, 20)
				bullet2.rotation_degrees = -s
				get_parent().add_child(bullet2)
				await get_tree().create_timer(0.08).timeout
		elif result == 2:
			if health <= 50-((level+1)*5)+(level*5):
				health += (level+1)*5
			elif 50-((level+1)*5)+(level*5) < health and health < 50+(level*5):
				health = 50+(level*5)
			elif health == 50+(level*5):
				$Sound_effects.stream = load("res://assets/fnaf-world-death-sound-made-with-Voicemod.mp3")
				$Sound_effects.play()
				var bullet1 = BULLET1.instantiate()
				bullet1.global_position = global_position + Vector2(0, 20)
				get_parent().add_child(bullet1)
			poison_value = 0
			SPEED += debuff
			debuff = 0
			$Heal.visible = true
			await get_tree().create_timer(2.0).timeout
			$Heal.visible = false
			GameManager.energy += 0.1
		elif result == 3:
			for s in range(-75,100,25):
				$Sound_effects.stream = load("res://assets/Bitting01.ogg")
				$Sound_effects.play()
				var bullet3 = BULLET3.instantiate()
				bullet3.global_position = global_position + Vector2(0, 25)
				bullet3.rotation_degrees = s
				get_parent().add_child(bullet3)
				await get_tree().create_timer(0.1).timeout
		await get_tree().create_timer(1).timeout
	$Timer.start(30-SPEED)
	$Wait_for_shooting.max_value = 30-SPEED

func _on_poison_timer_timeout() -> void:
	if GameManager.game_situation == 1:
		if poison_value > 0:
			take_damage(1)
			poison_value -= 1
