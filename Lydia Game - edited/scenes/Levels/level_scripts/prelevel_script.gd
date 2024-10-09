extends Control

@onready var next_sc = load("res://scenes/Levels/test.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(next_sc)
