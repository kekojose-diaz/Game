extends Area2D

@onready var timer: Timer = $Timer

var player = null
  
func _on_body_entered(body: Node2D) -> void:
	print("You died!!!")
	Engine.time_scale = 0.5
	get_tree().call_group("Player","die")
	#body.get_node("CollisionShape2D").queue_free();
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	print("GameManager.respawn_point: (" + str(GameManager.respawn_point.x) + "," + str(GameManager.respawn_point.y) + ")")
	if GameManager.respawn_point != Vector2(0,0):
		print("Intento conseguir el player")
		player =  get_tree().current_scene.get_node("Player")
	if player != null:
		player.position = GameManager.respawn_point
		print("New player position: (" + str(player.position.x) + "," + str(player.position.y) + ")")
	else:
		print("No tengo player")
		get_tree().reload_current_scene()
