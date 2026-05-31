extends CharacterBody2D

@onready var SPEED = 15.0
@onready var health = 50
@onready var level = 0

func take_damage(damage):
	health -= damage
	if health <= 0:
		level += 1
		if randi_range(0,1) == 0:
			global_position.x = 16
		else:
			global_position.x = 240
		health = 50+level*2
		$Health.max_value = health
