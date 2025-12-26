extends Control


func _on_b_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")


func _on_b_settings_pressed() -> void:
	GameManager.open_settings_from_main()


func _on_b_exit_pressed() -> void:
	get_tree().quit(0)
