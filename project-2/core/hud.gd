extends CanvasLayer

func _on_button_button_down() -> void:
	GameManager.game_situation = 1
	$Music.play()

func _physics_process(delta: float) -> void:
	$Store/LevelBar1.value = GameManager.friend_ship_level_1
	$Store/LevelBar2.value = GameManager.friend_ship_level_2
	$Store/LevelBar3.value = GameManager.friend_ship_level_3
	$Store/LevelBar4.value = GameManager.friend_ship_level_4
	$Store/LevelBar5.value = GameManager.friend_ship_level_5
	
	if GameManager.game_situation == 0:
		$You_died.visible = true
		$Name.visible = true
	else:
		$You_died.visible = false
		$Name.visible = false
	
	if GameManager.friend_ship_level_1 == 4:
		$Store/LevelBar1/Upgrade1.visible = false
		$Store/LevelBar1/Price.visible = false
		$Store/LevelBar1/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power4.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_1 >= 3:
		$Store/LevelBar1/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power4.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power3.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_1 >= 2:
		$Store/LevelBar1/Power3.visible = false
		$Store/LevelBar1/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power4.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_1 >= 1:
		$Store/LevelBar1/Power4.visible = false
		$Store/LevelBar1/Power3.visible = false
		$Store/LevelBar1/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar1/Power2.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_1 == 0:
		$Store/LevelBar1/Upgrade1.visible = true
		$Store/LevelBar1/Price.visible = true
		$Store/LevelBar1/Power4.visible = false
		$Store/LevelBar1/Power3.visible = false
		$Store/LevelBar1/Power2.visible = false
		$Store/LevelBar1/Power1.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
		
	if GameManager.friend_ship_level_2 == 4:
		$Store/LevelBar2/Upgrade2.visible = false
		$Store/LevelBar2/Price.visible = false
		$Store/LevelBar2/Power4.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_2 >= 3:
		$Store/LevelBar2/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power4.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_2 >= 2:
		$Store/LevelBar2/Power4.visible = false
		$Store/LevelBar2/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power3.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_2 >= 1:
		$Store/LevelBar2/Power4.visible = false
		$Store/LevelBar2/Power3.visible = false
		$Store/LevelBar2/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar2/Power2.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_2 == 0:
		$Store/LevelBar2/Upgrade2.visible = true
		$Store/LevelBar2/Price.visible = true
		$Store/LevelBar2/Power4.visible = false
		$Store/LevelBar2/Power3.visible = false
		$Store/LevelBar2/Power2.visible = false
		$Store/LevelBar2/Power1.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	
	if GameManager.friend_ship_level_3 == 4:
		$Store/LevelBar3/Upgrade3.visible = false
		$Store/LevelBar3/Price.visible = false
		$Store/LevelBar3/Power4.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_3 >= 3:
		$Store/LevelBar3/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power4.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_3 >= 2:
		$Store/LevelBar3/Power4.visible = false
		$Store/LevelBar3/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power3.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_3 >= 1:
		$Store/LevelBar3/Power4.visible = false
		$Store/LevelBar3/Power3.visible = false
		$Store/LevelBar3/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar3/Power2.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_3 == 0:
		$Store/LevelBar3/Upgrade3.visible = true
		$Store/LevelBar3/Price.visible = true
		$Store/LevelBar3/Power4.visible = false
		$Store/LevelBar3/Power3.visible = false
		$Store/LevelBar3/Power2.visible = false
		$Store/LevelBar3/Power1.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	
	if GameManager.friend_ship_level_4 == 4:
		$Store/LevelBar4/Upgrade4.visible = false
		$Store/LevelBar4/Price.visible = false
		$Store/LevelBar4/Power4.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_4 >= 3:
		$Store/LevelBar4/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power4.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_4 >= 2:
		$Store/LevelBar4/Power4.visible = false
		$Store/LevelBar4/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power3.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_4 >= 1:
		$Store/LevelBar4/Power4.visible = false
		$Store/LevelBar4/Power3.visible = false
		$Store/LevelBar4/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar4/Power2.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_4 == 0:
		$Store/LevelBar4/Upgrade4.visible = true
		$Store/LevelBar4/Price.visible = true
		$Store/LevelBar4/Power4.visible = false
		$Store/LevelBar4/Power3.visible = false
		$Store/LevelBar4/Power2.visible = false
		$Store/LevelBar4/Power1.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	
	if GameManager.friend_ship_level_5 == 4:
		$Store/LevelBar5/Upgrade5.visible = false
		$Store/LevelBar5/Price.visible = false
		$Store/LevelBar5/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power4.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_5 >= 3:
		$Store/LevelBar5/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power3.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power4.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_5 >= 2:
		$Store/LevelBar5/Power4.visible = false
		$Store/LevelBar5/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power2.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power3.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_5 >= 1:
		$Store/LevelBar5/Power4.visible = false
		$Store/LevelBar5/Power3.visible = false
		$Store/LevelBar5/Power1.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		$Store/LevelBar5/Power2.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	elif GameManager.friend_ship_level_5 == 0:
		$Store/LevelBar5/Upgrade5.visible = true
		$Store/LevelBar5/Price.visible = true
		$Store/LevelBar5/Power4.visible = false
		$Store/LevelBar5/Power3.visible = false
		$Store/LevelBar5/Power2.visible = false
		$Store/LevelBar5/Power1.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	
	if GameManager.money >= GameManager.friend_ship_level_1+1:
		$Store/LevelBar1/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	else:
		$Store/LevelBar1/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	if GameManager.money >= GameManager.friend_ship_level_2+1:
		$Store/LevelBar2/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	else:
		$Store/LevelBar2/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	if GameManager.money >= GameManager.friend_ship_level_3+1:
		$Store/LevelBar3/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	else:
		$Store/LevelBar3/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	if GameManager.money >= GameManager.friend_ship_level_4+1:
		$Store/LevelBar4/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	else:
		$Store/LevelBar4/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
	if GameManager.money >= GameManager.friend_ship_level_5+1:
		$Store/LevelBar5/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
	else:
		$Store/LevelBar5/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)

	$Store/LevelBar1/Price.text = str(GameManager.friend_ship_level_1+1)
	$Store/LevelBar2/Price.text = str(GameManager.friend_ship_level_2+1)
	$Store/LevelBar3/Price.text = str(GameManager.friend_ship_level_3+1)
	$Store/LevelBar4/Price.text = str(GameManager.friend_ship_level_4+1)
	$Store/LevelBar5/Price.text = str(GameManager.friend_ship_level_5+1)
	

func _on_go_to_store_pressed() -> void:
	$Store.visible = true
	$Name.visible = false
	$Back_to_Menu.visible = true
	$Store/LevelBar1/Price.visible = true

func _on_back_to_menu_pressed() -> void:
	GameManager.game_situation = 0
	get_tree().paused = false
	$Store.visible = false
	$Name.visible = true
	$Back_to_Menu.visible = false
	$Manual.visible = false
	$Pause.visible = false
	$Music.stop()

func _on_upgrade_1_pressed() -> void:
	if GameManager.money >= 1 and GameManager.friend_ship_level_1 == 0:
		GameManager.money -= 1
		GameManager.friend_ship_level_1 += 1
		$Buying.play()
	elif GameManager.money >= 2 and GameManager.friend_ship_level_1 == 1:
		GameManager.money -= 2
		GameManager.friend_ship_level_1 += 1
		$Buying.play()
	elif GameManager.money >= 3 and GameManager.friend_ship_level_1 == 2:
		GameManager.money -= 3
		GameManager.friend_ship_level_1 += 1
		$Buying.play()
	elif GameManager.money >= 4 and GameManager.friend_ship_level_1 == 3:
		GameManager.money -= 4
		GameManager.friend_ship_level_1 += 1
		$Buying.play()

func _on_go_to_manual_pressed() -> void:
	$Manual.visible = true
	$Name.visible = false
	$Back_to_Menu.visible = true

func _on_continue_pressed() -> void:
	$Pause.visible = false
	$Back_to_Menu.visible = false
	get_tree().paused = false

func _on_upgrade_2_pressed() -> void:
	if GameManager.money >= 1 and GameManager.friend_ship_level_2 == 0:
		GameManager.money -= 1
		GameManager.friend_ship_level_2 += 1
		$Buying.play()
	elif GameManager.money >= 2 and GameManager.friend_ship_level_2 == 1:
		GameManager.money -= 2
		GameManager.friend_ship_level_2 += 1
		$Buying.play()
	elif GameManager.money >= 3 and GameManager.friend_ship_level_2 == 2:
		GameManager.money -= 3
		GameManager.friend_ship_level_2 += 1
		$Buying.play()
	elif GameManager.money >= 4 and GameManager.friend_ship_level_2 == 3:
		GameManager.money -= 4
		GameManager.friend_ship_level_2 += 1
		$Buying.play()

func _on_upgrade_3_pressed() -> void:
	if GameManager.money >= 1 and GameManager.friend_ship_level_3 == 0:
		GameManager.money -= 1
		GameManager.friend_ship_level_3 += 1
		$Buying.play()
	elif GameManager.money >= 2 and GameManager.friend_ship_level_3 == 1:
		GameManager.money -= 2
		GameManager.friend_ship_level_3 += 1
		$Buying.play()
	elif GameManager.money >= 3 and GameManager.friend_ship_level_3 == 2:
		GameManager.money -= 3
		GameManager.friend_ship_level_3 += 1
		$Buying.play()
	elif GameManager.money >= 4 and GameManager.friend_ship_level_3 == 3:
		GameManager.money -= 4
		GameManager.friend_ship_level_3 += 1
		$Buying.play()

func _on_upgrade_4_pressed() -> void:
	if GameManager.money >= 1 and GameManager.friend_ship_level_4 == 0:
		GameManager.money -= 1
		GameManager.friend_ship_level_4 += 1
		$Buying.play()
	elif GameManager.money >= 2 and GameManager.friend_ship_level_4 == 1:
		GameManager.money -= 2
		GameManager.friend_ship_level_4 += 1
		$Buying.play()
	elif GameManager.money >= 3 and GameManager.friend_ship_level_4 == 2:
		GameManager.money -= 3
		GameManager.friend_ship_level_4 += 1
		$Buying.play()
	elif GameManager.money >= 4 and GameManager.friend_ship_level_4 == 3:
		GameManager.money -= 4
		GameManager.friend_ship_level_4 += 1
		$Buying.play()

func _on_upgrade_5_pressed() -> void:
	if GameManager.money >= 1 and GameManager.friend_ship_level_5 == 0:
		GameManager.money -= 1
		GameManager.friend_ship_level_5 += 1
		$Buying.play()
	elif GameManager.money >= 2 and GameManager.friend_ship_level_5 == 1:
		GameManager.money -= 2
		GameManager.friend_ship_level_5 += 1
		$Buying.play()
	elif GameManager.money >= 3 and GameManager.friend_ship_level_5 == 2:
		GameManager.money -= 3
		GameManager.friend_ship_level_5 += 1
		$Buying.play()
	elif GameManager.money >= 4 and GameManager.friend_ship_level_5 == 3:
		GameManager.money -= 4
		GameManager.friend_ship_level_5 += 1
		$Buying.play()
