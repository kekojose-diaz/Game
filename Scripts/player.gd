extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D

# Añade esta variable al inicio de tu script
var is_alive = true
var debug_mode := false
var debug_speed := 300.0  # Velocidad del movimiento libre

func die():
	print("Ejecutando player.die...")
	is_alive = false
	
func idle():
	print("Ejecutando player.idle...")
	is_alive = true

func _physics_process(delta: float) -> void:
	# Activar/desactivar modo debug con una tecla (por ejemplo F3)
	if Input.is_action_just_pressed("ui_debug"):  # O usa otra tecla
		debug_mode = !debug_mode
		print("Debug mode: ", debug_mode)
	
	# MODO DEBUG - Movimiento libre
	if debug_mode:
		velocity = Vector2.ZERO
		
		# Movimiento en todas las direcciones
		if Input.is_action_pressed("move_right"):
			velocity.x += debug_speed
		if Input.is_action_pressed("move_left"):
			velocity.x -= debug_speed
		if Input.is_action_pressed("move_up"):  # Necesitas crear esta acción
			velocity.y -= debug_speed
		if Input.is_action_pressed("move_down"):  # Y esta también
			velocity.y += debug_speed
		
		# Flip sprite en modo debug
		if velocity.x > 0:
			animated_sprite.flip_h = false
		elif velocity.x < 0:
			animated_sprite.flip_h = true
		
		if not is_alive:
			animated_sprite.play("die")  # O "run" si prefieres
		else:
			animated_sprite.play("idle")  # O "run" si prefieres
		move_and_slide()
		return  # Salir de la función, ignorar el resto del código
	
	# MODO NORMAL - Tu código original
	# Add the gravity.
	if (not is_on_floor()) and is_alive:
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and is_alive:
		velocity.y = JUMP_VELOCITY
	
	# Get input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if not is_alive:
		animated_sprite.play("die")
	elif is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if is_alive:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
	

#funcion original
#func _physics_process(delta: float) -> void:
	 #Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get input direction: -1, 0, 1
	#var direction := Input.get_axis("move_left", "move_right")
	#
	##Flip the Sprite
	#if direction > 0:
		#animated_sprite.flip_h = false
	#elif direction < 0:
		#animated_sprite.flip_h = true
	#
	##Play animations
	#if is_on_floor():
		#if direction == 0:
			#animated_sprite.play("idle")
		#else:
			#animated_sprite.play("run")
	#else:
		#animated_sprite.play("jump")
	#
	#
	##Apply movement
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
