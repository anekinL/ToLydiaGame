extends Control

@onready var replay_button = $PanelContainer/ColorRect/MarginContainer/Replay
@onready var replay_sc = load("res://scenes/Levels/prelevel.tscn")


func _ready():
	replay_button.pressed.connect(_r_button_pressed)

func _r_button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(replay_sc)
