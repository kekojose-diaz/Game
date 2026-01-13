extends Node2D

@onready var label_score: Label = %LabelScore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Evento ready Level 1")
	GameManager.respawn_point = Vector2(0,0)
	add_to_group("level")
	var musica_nivel1 = preload("res://Assets/Music/Sunlight Through Leaves.mp3")
	AudioManager.play_music(musica_nivel1)	
	GameManager.labelScore = label_score
	GameManager.reset_points()
	var numCookies = get_tree().get_node_count_in_group("Cookie")
	GameManager.set_max_points(numCookies)
