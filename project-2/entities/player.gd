extends CharacterBody2D

const FRIENDSHIP1 = preload("res://entities/friend_ship_1.tscn")
const SPEED = 10.0

func _physics_process(delta: float) -> void:
	var x_direction := Input.get_axis("ui_left", "ui_right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var y_direction := Input.get_axis("ui_up", "ui_down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if Input.is_action_just_pressed("create_ship_1"):
		var ship1 = FRIENDSHIP1.instantiate()
		ship1.global_position = global_position + Vector2(0, -20)
		get_parent().add_child(ship1)

	move_and_slide()
