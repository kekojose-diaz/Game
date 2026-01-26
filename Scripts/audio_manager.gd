extends Node

var music_player = AudioStreamPlayer.new()
var current_music = null

func _ready():
	add_child(music_player)
	music_player.bus = "Music"

# Función para cambiar la música
func play_music(music_stream):
	# Si ya está sonando la misma música, no hacer nada
	if current_music == music_stream and music_player.playing:
		return
	
	current_music = music_stream
	music_player.stream = music_stream
	music_player.play()

# Función para detener la música
func stop_music():
	music_player.stop()
	current_music = null

# Función para pausar/despausar
func toggle_pause():
	music_player.stream_paused = !music_player.stream_paused
