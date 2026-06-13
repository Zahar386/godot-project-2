extends CanvasLayer

func _on_button_button_down() -> void:
	GameManager.game_situation = 1

func _physics_process(delta: float) -> void:
	if GameManager.game_situation == 0:
		visible = true
	else:
		visible = false
