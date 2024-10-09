extends Node2D

@onready var replay_button = $PanelContainer/HBoxContainer/MarginContainer/Replay
@onready var continue_button = $PanelContainer/HBoxContainer/MarginContainer2/Continue_button
@onready var replay_sc = load("res://scenes/Levels/level_3.tscn")
@onready var next_sc = load("res://scenes/Levels/level_4.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	replay_button.pressed.connect(_r_button_pressed)
	continue_button.pressed.connect(_c_button_pressed)
	
	Dialogic.start("Level3b_dialogue")
	await Dialogic.timeline_ended
	$PanelContainer.position = $Marker2D.get_global_position()

func _r_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(replay_sc)
	
func _c_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(next_sc)

