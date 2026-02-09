extends Control

func _ready() -> void:
	var musica_menu = preload("res://Assets/Music/Cuddle Clouds.mp3")
	AudioManager.play_music(musica_menu)	
	
func _on_b_play_pressed() -> void:
	print("Botón Play presionado")
	print("Ruta de escena: res://Scenes/Level1.tscn")
	print("¿Escena existe?: ", ResourceLoader.exists("res://Scenes/Level1.tscn"))	
	TransitionScene.transition(false)
	await TransitionScene._on_transition_finished
	print("Transición completada, cambiando escena...")
	var error = get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	print("Resultado del cambio: ", error)


func _on_b_settings_pressed() -> void:
	GameManager.open_settings_from_main()


func _on_b_exit_pressed() -> void:
	get_tree().quit(0)
