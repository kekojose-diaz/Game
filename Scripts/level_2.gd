extends Node2D

var audioPlayer : AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready of Level2")
	audioPlayer = Music.get_node("AudioStreamPlayer")
	if audioPlayer != null:
		print("AudioPlayer assigned")
		audioPlayer.stream = load("res://Assets/Music/Strange Worlds.mp3")
		audioPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
