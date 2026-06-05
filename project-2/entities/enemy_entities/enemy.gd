extends CharacterBody2D

@onready var SPEED = 15.0
@onready var health = 50
@onready var level = 0

func take_damage(damage):
	health -= damage
	if health <= 0:
		level += 1
		if randi_range(0,1) == 0:
			global_position.x = -34
		else:
			global_position.x = 290
		health = 50+(level*5)
		$Sprite2D.self_modulate.g8 -= level*10
		$Sprite2D.self_modulate.b8 -= level*10
		SPEED += 1
		$Health.max_value = health
		$Wait_for_shooting.max_value = 30-SPEED
		$Timer.start(30-SPEED)

func _physics_process(delta: float) -> void:
	$Wait_for_shooting.value = $Timer.wait_time - $Timer.time_left


func _on_timer_timeout() -> void:
	pass # Replace with function body.
