extends Area2D

@export_file
var NEXT_LEVEL: String = "" 

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	if (NEXT_LEVEL != "") and (body.is_in_group("Player")):
		animation_player.play("Teleport")

func do_change_level():
	get_tree().change_scene_to_file(NEXT_LEVEL)
