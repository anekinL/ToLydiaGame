extends Control

@onready var replay_button = $PanelContainer/HBoxContainer/MarginContainer/Replay
@onready var continue_button = $PanelContainer/HBoxContainer/MarginContainer2/Continue_button
@onready var replay_sc = load("res://scenes/Levels/level_4.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	replay_button.pressed.connect(_r_button_pressed)
	continue_button.pressed.connect(_c_button_pressed)

func _r_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(replay_sc)
	
func _c_button_pressed():
	get_tree().quit()
