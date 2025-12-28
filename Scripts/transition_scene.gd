extends CanvasLayer

signal _on_transition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if ((anim_name == "fade_to_black") or (anim_name == "fade_to_black_sound")):
		_on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		color_rect.visible = false
	
func transition(with_sound:bool):
	color_rect.visible = true
	if(with_sound):
		animation_player.play("fade_to_black_sound")
	else:
		animation_player.play("fade_to_black")
