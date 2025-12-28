extends Area2D

@export_file
var NEXT_LEVEL: String = "" 

func _on_body_entered(body: Node2D) -> void:
	if (NEXT_LEVEL != "") and (body.is_in_group("Player")):
		print("Transition to NEXT_LEVEL=" + NEXT_LEVEL)
		TransitionScene.transition(true)
		await TransitionScene._on_transition_finished
		get_tree().change_scene_to_file(NEXT_LEVEL)
