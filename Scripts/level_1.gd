extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Evento ready Level 1")
	add_to_group("level")
	GameManager.reset_points()
	var numCookies = get_tree().get_node_count_in_group("Cookie")
	GameManager.set_max_points(numCookies)
