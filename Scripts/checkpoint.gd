extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Checkpoint detected")
	if body.is_in_group("Player"):
		GameManager.respawn_point = $RespawnPoint.global_position
		print("Checkpoint saved: (" + str(GameManager.respawn_point.x) + "," + str(GameManager.respawn_point.y) + ")")
