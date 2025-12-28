extends Control

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_b_back_pressed() -> void:
	GameManager.back_from_settings()


func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	if (value_changed):
		print("SFX Slider drag ended with value changed")
		audio_stream_player.play(0)
