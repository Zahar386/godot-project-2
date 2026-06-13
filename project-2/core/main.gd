extends Node2D

@onready var pl = $Player
@onready var en = $Enemy

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 0:
		pl.health = 100
		pl.global_position.x = 128
		en.global_position.x = 290
		en.level = 0
		GameManager.metall = 70
		GameManager.energy = 1
		$Music.stream_paused = true
		$HUD.visible = true
		pl.visible = false
		en.visible = false
		$Walls.visible = false
		$Player/Timer.start(3)
		$Enemy/Timer.start(16)
	elif GameManager.game_situation == 1:
		$Music.stream_paused = false
		$HUD.visible = false
		pl.visible = true
		en.visible = true
		$Walls.visible = true
		if pl.health <= 0:
			GameManager.game_situation = 0
		
		$Walls/Level.text = "Level: "+str(en.level+1)
		$Walls/Metall.text = str(GameManager.metall)
		$Walls/Energy.text = str(2-GameManager.energy)
		
		if pl.global_position.x > en.global_position.x:
			en.global_position.x += en.SPEED*delta
		if pl.global_position.x < en.global_position.x:
			en.global_position.x -= en.SPEED*delta
		
		if GameManager.metall >= 10:
			$Walls/Metall_price_1.self_modulate = Color("00ff00ff")
		else:
			$Walls/Metall_price_1.self_modulate = Color("ff0000ff")
		if GameManager.metall >= 20:
			$Walls/Metall_price_2.self_modulate = Color("00ff00ff")
		else:
			$Walls/Metall_price_2.self_modulate = Color("ff0000ff")
		if GameManager.metall >= 30:
			$Walls/Metall_price_3.self_modulate = Color("00ff00ff")
		else:
			$Walls/Metall_price_3.self_modulate = Color("ff0000ff")
		if GameManager.metall >= 40:
			$Walls/Metall_price_4.self_modulate = Color("00ff00ff")
		else:
			$Walls/Metall_price_4.self_modulate = Color("ff0000ff")
		
	if $Background.region_rect.position.y < 64:
		$Background.region_rect.position.y += 0.33
	else:
		$Background.region_rect.position.y = 0
	$Cash/Money.text = str(GameManager.money)
