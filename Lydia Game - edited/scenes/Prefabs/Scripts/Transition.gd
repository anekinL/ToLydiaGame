extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var anim_player = $AnimationPlayer

signal on_transition_finished

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	anim_player.animation_finished.connect(_animation_finished)
	
func _animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		anim_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		color_rect.visible = false
		
func transition():
	color_rect.visible = true
	anim_player.play("fade_to_black")
