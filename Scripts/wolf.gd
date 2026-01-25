extends Node2D

var SPEED = 80
var direction = 1

@onready var ray_cast_left: RayCast2D = $RayCast_left
@onready var ray_cast_right: RayCast2D = $RayCast_right
@onready var ray_cast_down_right: RayCast2D = $RayCast_down_right
@onready var ray_cast_down_left: RayCast2D = $RayCast_down_left
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not ray_cast_down_right.is_colliding(): 
		direction = -1
		animated_sprite.flip_h = true
	if not ray_cast_down_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
