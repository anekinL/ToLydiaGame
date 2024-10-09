extends Control

@onready var choice1 = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/Choice1
@onready var choice2 = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer2/Choice2
@onready var choice3 = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/Choice3
@onready var choice4 = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer2/Choice4
# Called when the node enters the scene tree for the first time.
func _ready():
	choice1.pressed.connect(_button1_pressed)
	choice2.pressed.connect(_button2_pressed)
	choice3.pressed.connect(_button3_pressed)
	choice4.pressed.connect(_button4_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_choice1(text:String):
	choice1.set_text(text)
	
func set_choice2(text:String):
	choice2.set_text(text)
	
func set_choice3(text:String):
	choice3.set_text(text)
	
func set_choice4(text:String):
	choice4.set_text(text)
	
func set_choiceall(text1:String, text2:String, text3:String, text4:String):
	choice1.set_text(text1)
	choice2.set_text(text2)
	choice3.set_text(text3)
	choice4.set_text(text4)

func _button1_pressed():
	Globals.choice_pressed = true
	Globals.choice1_pressed = true
	print(1)
	
func _button2_pressed():
	Globals.choice_pressed = true
	Globals.choice2_pressed = true
	print(2)
func _button3_pressed():
	Globals.choice_pressed = true
	Globals.choice3_pressed = true
	print(3)
func _button4_pressed():
	Globals.choice_pressed = true
	Globals.choice4_pressed = true
	print(4)
