extends Control

#@onready var pause_menu: Control = $"."
#@onready var menu_settings: Control = $"../MenuSettings"

#func resume():
#	pause_menu.hide()
#	get_tree().paused = false
	
#func pause():
#	get_tree().paused = true
#	pause_menu.show()

#func testEsc():
#	if Input.is_action_just_pressed("Escape") and (not get_tree().paused):
#		pause()
#	elif Input.is_action_just_pressed("Escape") and (pause_menu.is_visible_in_tree()) and (get_tree().paused):
#		resume()

func _on_b_resume_pressed() -> void:
	GameManager.resume_game()


func _on_b_restart_pressed() -> void:
	GameManager.restart_game()


func _on_b_settings_pressed() -> void:
	GameManager.open_settings_from_pause()


func _on_b_exit_pressed() -> void:
	GameManager.quit_to_main_menu()
	
