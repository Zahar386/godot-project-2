extends CanvasLayer

func _on_button_button_down() -> void:
	GameManager.game_situation = 1

func _physics_process(delta: float) -> void:
	$Store/LevelBar1.value = GameManager.friend_ship_level_1
	$Store/LevelBar2.value = GameManager.friend_ship_level_2
	$Store/LevelBar3.value = GameManager.friend_ship_level_3
	$Store/LevelBar4.value = GameManager.friend_ship_level_4
	$Store/LevelBar5.value = GameManager.friend_ship_level_5
	if GameManager.game_situation == 0:
		visible = true
		$You_died.text = "Вы умерли "+str(GameManager.deaths)+" раз(а)"
	else:
		visible = false


func _on_go_to_store_pressed() -> void:
	$Store.visible = true
	$Start.visible = false
	$Go_to_Store.visible = false
	$Name.visible = false
