extends Node2D


@onready var button = $PanelContainer/MarginContainer/Continue_button
@onready var sound = $msg_sound
@onready var sound_r = $msg_recieved
@onready var choices = load("res://scenes/Prefabs/choices_layout.tscn")
@onready var nextScene = load("res://scenes/Levels/Level_3b.tscn")
@onready var textmsg = load("res://scenes/Prefabs/test_text_obj.tscn")
@onready var anim = preload("res://scenes/Prefabs/grey_anim_node.tscn")

var c_arr = ["are you stupid?", "are you okay???", "what? wym??","wtf fr?",
			 "you dumbass", "why would you open the door so late", "Anekin.....", "LMFAO"]
var c_index = 0
var choice_index = 0
var choice_num = 0

var instance
var flag = false
var flag_index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	button.pressed.connect(_button_pressed)
	choices = choices.instantiate()
	choices.position = $Options.get_global_position()
	await message_inst($phone_imessage/M1.get_global_position(), $Control/A1_2,2,false)
	await message_inst($phone_imessage/M2.get_global_position(), $Control/A1_3,2,true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Globals.choice_pressed):
		if choice_index == 1:
			if (Globals.choice1_pressed):
				$Control/L1_1a.position = $phone_imessage/ML2.get_global_position()
				choice_num = 1
			elif (Globals.choice2_pressed):
				$Control/L1_1b.position = $phone_imessage/ML2.get_global_position()
				choice_num = 2
			elif (Globals.choice3_pressed):
				$Control/L1_1c.position = $phone_imessage/ML2.get_global_position()
				choice_num = 3
			elif (Globals.choice4_pressed):
				$Control/L1_1d.position = $phone_imessage/ML2.get_global_position()
				choice_num = 4
			else:
				print("Error")
				
		elif choice_index == 2:
			if (Globals.choice1_pressed):
				$Control/L1_2a.position = $phone_imessage/ML4.get_global_position()
				choice_num = 1
			elif (Globals.choice2_pressed):
				$Control/L1_2b.position = $phone_imessage/ML4_d.get_global_position()
				choice_num = 2
			elif (Globals.choice3_pressed):
				$Control/L1_2c.position = $phone_imessage/ML4.get_global_position()
				choice_num = 3
			elif (Globals.choice4_pressed):
				$Control/L1_2d.position = $phone_imessage/ML4.get_global_position()
				choice_num = 4
			else:
				print("Error")
				
		Globals.choice_pressed = false
		Globals.choice1_pressed = false
		Globals.choice2_pressed = false
		Globals.choice3_pressed = false
		Globals.choice4_pressed = false
		remove_child(choices)
		sound.play()
		flag = true
		flag_index +=1
			
	if (flag):
		flag = false
		print("this " + str(choice_num))
		if flag_index == 1:
			if choice_num == 1:
				choice_num = 0
				await message_inst($phone_imessage/M3.get_global_position(), $Control/A1_4a,2,false)
				break_in()
			elif choice_num == 2:
				choice_num = 0
				await message_inst($phone_imessage/M3.get_global_position(), $Control/A1_4b,2,false)
				break_in()
			elif choice_num == 3:
				choice_num = 0
				await message_inst($phone_imessage/M3.get_global_position(), $Control/A1_4c,2,false)
				break_in()
			elif choice_num == 4:
				choice_num = 0
				await message_inst($phone_imessage/M3.get_global_position(), $Control/A1_4d,2,false)
				break_in()
			else:
				print("Error")
				
		elif flag_index == 2:
			if choice_num == 1:
				choice_num = 0
				await message_inst($phone_imessage/M7.get_global_position(), $Control/A1_8a,2,false)
			elif choice_num == 2:
				choice_num = 0
				await message_inst($phone_imessage/M7.get_global_position(), $Control/A1_8b,2,false)
			elif choice_num == 3:
				choice_num = 0
				await message_inst($phone_imessage/M7.get_global_position(), $Control/A1_8c,2,false)
			elif choice_num == 4:
				choice_num = 0
				await message_inst($phone_imessage/M7.get_global_position(), $Control/A1_8d,2,false)
				
			else:
				print("Error")
				
			await get_tree().create_timer(3).timeout
			get_tree().change_scene_to_file("res://scenes/Levels/level_3b.tscn")
			#$PanelContainer.position = $Camera2D.get_global_position()
				
func break_in():
	await message_inst($phone_imessage/M4.get_global_position(), $Control/A1_5,2,false)
	await message_inst($phone_imessage/M5.get_global_position(), $Control/A1_6,2,false)
	await message_inst($phone_imessage/M6.get_global_position(), $Control/A1_7,2,true)

func message_inst(pos, next_msg, idle_time:float, go):
	instance = anim.instantiate()
	instance.position = pos
	instance.scale = Vector2(0.45,0.45)
	add_child(instance)
	instance.play("sending")
	await get_tree().create_timer(idle_time).timeout
	remove_child(instance)
	next_msg.position = pos
	sound_r.play()
	if (go):
		choices_inst()

func choices_inst():
	add_child(choices)
	choices.set_choiceall(c_arr[c_index], c_arr[c_index+1], c_arr[c_index+2], c_arr[c_index+3])
	c_index += 4
	choice_index +=1

func _button_pressed():
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_packed(nextScene)
