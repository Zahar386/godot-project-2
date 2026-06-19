extends Node2D

@onready var pl = $Player
@onready var en = $Enemy

func _ready() -> void:
	add_to_group("Persist")
	load_game()

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 0:
		pl.health = 100
		pl.global_position.x = 128
		en.global_position.x = 290
		en.level = 0
		en.health = 50
		if GameManager.friend_ship_level_4 >= 3:
			GameManager.metall = 70
		else:
			GameManager.metall = 50
		if GameManager.friend_ship_level_5 >= 2:
			GameManager.energy = 1.4
			$Player/Timer.start(3*0.6)
		else:
			GameManager.energy = 1
			$Player/Timer.start(3)
		$HUD/Music.stream_paused = true
		pl.visible = false
		en.visible = false
		en.health = 50
		en.poison_value = 0
		pl.poison_value = 0
		en.SPEED = 14
		en.debuff = 0
		$Enemy/Health.max_value = 50
		$Walls.visible = false
		$Enemy/Timer.start(16)
		$HUD/You_died.text = "Вы умерли "+str(pl.deaths)+" раз(а)"
		$Exit_game.visible = true
	elif GameManager.game_situation == 1:
		$Exit_game.visible = false
		if Input.is_action_just_pressed("stop_game"):
			$HUD/Pause.visible = true
			$HUD/Back_to_Menu.visible = true
			$HUD/Music.stream_paused = true
			get_tree().paused = true
		$HUD/You_died.visible = false
		pl.visible = true
		en.visible = true
		$Walls.visible = true
		if pl.health <= 0:
			GameManager.game_situation = 0
		GameManager.metall = int(GameManager.metall)
		
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
			$Walls/Metall_price_4.self_modulate = Color("00ff00ff")
		else:
			$Walls/Metall_price_4.self_modulate = Color("ff0000ff")
		if GameManager.metall >= 40:
			$Walls/Metall_price_3.self_modulate = Color("00ff00ff")
		else:
			$Walls/Metall_price_3.self_modulate = Color("ff0000ff")
		
		if 2-GameManager.energy > 0.1:
			$Walls/Energy_price_1.self_modulate = Color("ffff00ff")
		else:
			$Walls/Energy_price_1.self_modulate = Color("7d00ffff")
		if 2-GameManager.energy > 0.15:
			$Walls/Energy_price_2.self_modulate = Color("ffff00ff")
		else:
			$Walls/Energy_price_2.self_modulate = Color("7d00ffff")
		if 2-GameManager.energy > 0.3:
			$Walls/Energy_price_4.self_modulate = Color("ffff00ff")
		else:
			$Walls/Energy_price_4.self_modulate = Color("7d00ffff")
		if 2-GameManager.energy > 0.45:
			$Walls/Energy_price_3.self_modulate = Color("ffff00ff")
		else:
			$Walls/Energy_price_3.self_modulate = Color("7d00ffff")
		
		if GameManager.money >= (GameManager.friend_ship_level_1+1)*2:
			$HUD/Store/LevelBar1/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		else:
			$HUD/Store/LevelBar1/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
		if GameManager.money >= (GameManager.friend_ship_level_2+1)*2:
			$HUD/Store/LevelBar2/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		else:
			$HUD/Store/LevelBar2/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
		if GameManager.money >= (GameManager.friend_ship_level_3+1)*2:
			$HUD/Store/LevelBar3/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		else:
			$HUD/Store/LevelBar3/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
		if GameManager.money >= (GameManager.friend_ship_level_4+1)*2:
			$HUD/Store/LevelBar4/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		else:
			$HUD/Store/LevelBar4/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
		if GameManager.money >= (GameManager.friend_ship_level_5+1)*2:
			$HUD/Store/LevelBar5/Price.self_modulate = Color(0.0, 1.0, 0.0, 1.0)
		else:
			$HUD/Store/LevelBar5/Price.self_modulate = Color(1.0, 0.0, 0.0, 1.0)
			
	if $Background.region_rect.position.y < 64:
		$Background.region_rect.position.y += 0.33
	else:
		$Background.region_rect.position.y = 0
	$Cash/Money.text = str(GameManager.money)
	$Cash/High_score.text = "High score " + str(GameManager.high_score+1) + " level"

func save():
	var save_dict = {
		"money":GameManager.money,
		"level_1":GameManager.friend_ship_level_1,
		"level_2":GameManager.friend_ship_level_2,
		"level_3":GameManager.friend_ship_level_3,
		"level_4":GameManager.friend_ship_level_4,
		"level_5":GameManager.friend_ship_level_5,
		"high_score":GameManager.high_score}
	return save_dict

func save_game():
	var save_file = FileAccess.open("res://savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	var node_data = self.call("save")
	var json_string = JSON.stringify(node_data)
	save_file.store_line(json_string)

func load_game():
	var save_file = FileAccess.open("res://savegame.save", FileAccess.READ)
	var json_string = save_file.get_line()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	var node_data = json.data
	if node_data != null:
		GameManager.money = int(node_data["money"])
		GameManager.friend_ship_level_1 = int(node_data["level_1"])
		GameManager.friend_ship_level_2 = int(node_data["level_2"])
		GameManager.friend_ship_level_3 = int(node_data["level_3"])
		GameManager.friend_ship_level_4 = int(node_data["level_4"])
		GameManager.friend_ship_level_5 = int(node_data["level_5"])
		GameManager.high_score = int(node_data["high_score"])

func _on_exit_game_pressed() -> void:
	save_game()
	get_tree().quit()


func _on_erase_data_pressed() -> void:
	GameManager.money = 0
	GameManager.friend_ship_level_1 = 0
	GameManager.friend_ship_level_2 = 0
	GameManager.friend_ship_level_3 = 0
	GameManager.friend_ship_level_4 = 0
	GameManager.friend_ship_level_5 = 0
	GameManager.high_score = 0
	save_game()
