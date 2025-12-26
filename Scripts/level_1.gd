extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("level")
	GameManager.reset_points()
	GameManager.set_max_points(25)
