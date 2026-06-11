extends CharacterBody2D

const FRIENDSHIP1 = preload("res://entities/player_entities/friend_ship_1.tscn")
const FRIENDSHIP3 = preload("res://entities/player_entities/friend_ship_3.tscn")
const FRIENDSHIP4 = preload("res://entities/player_entities/friend_ship_4.tscn")
const SPEED = 30.0

@onready var can_shoot = false
@onready var health = 100

func _physics_process(delta: float) -> void:
	var x_direction := Input.get_axis("ui_left", "ui_right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if can_shoot == true and GameManager.energy < 2:
		if Input.is_action_just_pressed("create_ship_1") and GameManager.metall >= 10:
			GameManager.metall -= 10
			var ship1 = FRIENDSHIP1.instantiate()
			ship1.global_position = global_position + Vector2(0, -25)
			get_parent().add_child(ship1)
			GameManager.energy += 0.05
			can_shoot = false
			$Wait_for_creating.value = 0
			if GameManager.energy >= 2:
				GameManager.energy = 0
			$Timer.start(3 * GameManager.energy)
			$Wait_for_creating.max_value = $Timer.wait_time
		if Input.is_action_just_pressed("create_ship_3") and GameManager.metall >= 30:
			GameManager.metall -= 30
			var ship3 = FRIENDSHIP3.instantiate()
			ship3.global_position = global_position + Vector2(0, -25)
			get_parent().add_child(ship3)
			GameManager.energy += 0.2
			can_shoot = false
			$Wait_for_creating.value = 0
			if GameManager.energy >= 2:
				GameManager.energy = 0
			$Timer.start(3 * GameManager.energy)
			$Wait_for_creating.max_value = $Timer.wait_time
		if Input.is_action_just_pressed("create_ship_4") and GameManager.metall >= 20:
			GameManager.metall -= 20
			var ship4 = FRIENDSHIP4.instantiate()
			ship4.global_position = global_position + Vector2(0, -25)
			get_parent().add_child(ship4)
			GameManager.energy += 0.15
			can_shoot = false
			$Wait_for_creating.value = 0
			if GameManager.energy >= 2:
				GameManager.energy = 0
			$Timer.start(3 * GameManager.energy)
			$Wait_for_creating.max_value = $Timer.wait_time
	$Wait_for_creating.value = $Timer.wait_time - $Timer.time_left
	$Health.value = health
	
	move_and_slide()

func _on_timer_timeout() -> void:
	$Timer.stop()
	can_shoot = true

func take_damage(damage):
	health -= damage
	$Get_damage.play()
	if health <= 0:
		pass
