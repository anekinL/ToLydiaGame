extends Node

var somevar = false
var choice_pressed = false
var choice1_pressed = false
var choice2_pressed = false
var choice3_pressed = false
var choice4_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_choices(dialogue_name:String, location):
	var layout = Dialogic.start(dialogue_name)
	layout.register_character(null,location)
