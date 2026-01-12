extends Node2D
#Errror de la musica: Se reinicia la musica al morir antes de coger un checkpoint.
#Error de el personaje: Al morir despues de haber cogido un checkpoint, se vuelve rojo y no se mueve.
#Error del background: todavia funciona un poco mal aun, pero te lo dejo pasar





@onready var label_score: Label = %LabelScore
var audioPlayer : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready of Level2")
	audioPlayer = Music.get_node("AudioStreamPlayer")
	if audioPlayer != null:
		print("AudioPlayer assigned")
		audioPlayer.stream = load("res://Assets/Music/Wanderer's Tale.mp3")
		audioPlayer.play()
	print("Evento ready Level 1")
	add_to_group("level")
	GameManager.labelScore = label_score
	GameManager.reset_points()
	var numCookies = get_tree().get_node_count_in_group("Cookie")
	GameManager.set_max_points(numCookies)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
