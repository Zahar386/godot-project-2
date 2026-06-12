extends CharacterBody2D

const FRIENDSHIP1 = preload("res://entities/player_entities/friend_ship_1.tscn")
const FRIENDSHIP2 = preload("res://entities/player_entities/friend_ship_2.tscn")
const FRIENDSHIP3 = preload("res://entities/player_entities/friend_ship_3.tscn")
const FRIENDSHIP4 = preload("res://entities/player_entities/friend_ship_4.tscn")

@onready var SPEED = 30.0
@onready var can_shoot = false
@onready var health = 100
@onready var poison_value = 0

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 1:
		if poison_value > 0:
			$Health.self_modulate = Color("00ff00ff")
		else:
			$Health.self_modulate = Color("ff0000ff")
		var x_direction := Input.get_axis("ui_left", "ui_right")
		if x_direction:
			velocity.x = x_direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if can_shoot == true and GameManager.energy < 2:
			if Input.is_action_just_pressed("create_ship_1") and GameManager.metall >= 10 and 2-GameManager.energy >= 0.09:
				GameManager.metall -= 10
				var ship1 = FRIENDSHIP1.instantiate()
				ship1.global_position = global_position + Vector2(0, -25)
				get_parent().add_child(ship1)
				GameManager.energy += 0.1
				can_shoot = false
				$Wait_for_creating.value = 0
				$Timer.start(3 * GameManager.energy)
				$Wait_for_creating.max_value = $Timer.wait_time
				SPEED -= 1
			if Input.is_action_just_pressed("create_ship_2") and GameManager.metall >= 15 and 2-GameManager.energy >= 0.14:
				GameManager.metall -= 15
				var ship2 = FRIENDSHIP2.instantiate()
				ship2.global_position = global_position + Vector2(0, -25)
				get_parent().add_child(ship2)
				GameManager.energy += 0.15
				can_shoot = false
				$Wait_for_creating.value = 0
				$Timer.start(3 * GameManager.energy)
				$Wait_for_creating.max_value = $Timer.wait_time
			if Input.is_action_just_pressed("create_ship_3") and GameManager.metall >= 35 and 2-GameManager.energy >= 0.39:
				GameManager.metall -= 35
				var ship3 = FRIENDSHIP3.instantiate()
				ship3.global_position = global_position + Vector2(0, -25)
				get_parent().add_child(ship3)
				GameManager.energy += 0.4
				can_shoot = false
				$Wait_for_creating.value = 0
				$Timer.start(3 * GameManager.energy)
				$Wait_for_creating.max_value = $Timer.wait_time
			if Input.is_action_just_pressed("create_ship_4") and 2-GameManager.energy >= 0.29:
				GameManager.energy += 0.3
				var ship4 = FRIENDSHIP4.instantiate()
				ship4.global_position = global_position + Vector2(0, -25)
				get_parent().add_child(ship4)
				can_shoot = false
				$Wait_for_creating.value = 0
				$Timer.start(3 * GameManager.energy)
				$Wait_for_creating.max_value = $Timer.wait_time
		$Wait_for_creating.value = $Timer.wait_time - $Timer.time_left
		$Health.value = health
		
		if GameManager.energy > 2:
			GameManager.energy = 2
			$Timer.stop()
		
		move_and_slide()

func _on_timer_timeout() -> void:
	can_shoot = true
	GameManager.metall += 1
	GameManager.energy += 0.01

func take_damage(damage):
	health -= damage
	$Get_damage.play()
	if health <= 0:
		pass

func _on_poison_timer_timeout() -> void:
	if poison_value > 0:
		take_damage(1)
		poison_value -= 1
