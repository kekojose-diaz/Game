extends Node2D


@onready var label_score: Label = %LabelScore
var audioPlayer : AudioStreamPlayer
var changedAudio: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Evento ready Level 2")
	GameManager.respawn_point = Vector2(0,0)
	add_to_group("level")
	var musica_nivel2 = preload("res://Assets/Music/Wanderer's Tale.mp3")
	AudioManager.play_music(musica_nivel2)	
#	audioPlayer = Music.get_node("AudioStreamPlayer")
#	if (audioPlayer != null) and (not changedAudio):
#		print("AudioPlayer assigned")
#		changedAudio = true
#		print("AudioPlayer changed audio")
#		audioPlayer.stream = load("res://Assets/Music/Wanderer's Tale.mp3")
#		audioPlayer.play()
	GameManager.labelScore = label_score
	GameManager.reset_points()
	var numCookies = get_tree().get_node_count_in_group("Cookie")
	GameManager.set_max_points(numCookies)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
