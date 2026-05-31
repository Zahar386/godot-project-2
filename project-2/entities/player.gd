extends CharacterBody2D

const FRIENDSHIP1 = preload("res://entities/friend_ship_1.tscn")
const SPEED = 30.0
@onready var can_shoot = false
@onready var health = 100

func _physics_process(delta: float) -> void:
	var x_direction := Input.get_axis("ui_left", "ui_right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("create_ship_1") and can_shoot == true:
		var ship1 = FRIENDSHIP1.instantiate()
		ship1.global_position = global_position + Vector2(0, -25)
		get_parent().add_child(ship1)
		can_shoot = false
		$Wait_for_creating.value = 0
		$Timer.start(3)
	
	$Wait_for_creating.value = $Timer.wait_time - $Timer.time_left
	$Health.value = health
	
	move_and_slide()

func _on_timer_timeout() -> void:
	$Timer.stop()
	can_shoot = true

func take_damage(damage):
	health -= damage
	if health <= 0:
		pass
