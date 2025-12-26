extends CanvasLayer

var pause_menu_scene = preload("res://Scenes/MenuPause.tscn")
var settings_menu_scene = preload("res://Scenes/MenuSettings.tscn")

var score = 0
var max_score_level = 0
var previous_scene: String = ""

var current_menu: Control = null
var previous_context: String = ""  # "pause" o "main_menu"

func _ready():
	# Este CanvasLayer estará siempre presente
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _input(event):
	if event.is_action_pressed("Escape") and (current_menu == null) and (not get_tree().paused):
		# Solo abrir pausa si estamos en un nivel (no en menú principal)
		print("Input event Escape pressed 2")
		if get_tree().current_scene.is_in_group("level"):
			print("Input event Escape pressed 3")
			open_pause_menu()
	elif event.is_action_pressed("Escape") and (get_tree().paused):
		resume_game()
		

func open_pause_menu():
	if current_menu != null:
		return
	get_tree().paused = true
	current_menu = pause_menu_scene.instantiate()
	add_child(current_menu)
	
func resume_game():
	get_tree().paused = false
	_close_current_menu()

func open_settings_from_pause():
	previous_context = "pause_menu"
	_close_current_menu()
	current_menu = settings_menu_scene.instantiate()
	add_child(current_menu)
	
func open_settings_from_main():
	previous_context = "main_menu"
	current_menu = get_tree().current_scene
	_close_current_menu()
	current_menu = settings_menu_scene.instantiate()
	add_child(current_menu)

func quit_to_main_menu():
	get_tree().paused = false
	_close_current_menu()
	get_tree().change_scene_to_file("res://Scenes/MenuMain.tscn")
	

func back_from_settings():
	_close_current_menu()
	if previous_context == "pause_menu":
		open_pause_menu()
	elif previous_context == "main_menu":
		get_tree().change_scene_to_file("res://Scenes/MenuMain.tscn")
	# Si es "main_menu", ya estamos en esa escena

func _close_current_menu():
	if current_menu:
		current_menu.queue_free()
		current_menu = null

func reset_points():
	score = 0
	print("Resetado el score:" + str(score))

func set_max_points(max: int):
	max_score_level = max
  
func add_point():
	score += 1
	print("Score:" + str(score))
	
func set_previous_scene(scene_name: String):
	previous_scene = scene_name

func get_previous_scene() -> String:
	return previous_scene	
