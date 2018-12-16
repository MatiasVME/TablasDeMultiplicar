extends Node2D

onready var correct = get_node("Correct")
onready var incorrect = get_node("Incorrect")

func _ready():
	correct.set_text(str(tr("CORRECT"), ": ", Global.current_correct))
	incorrect.set_text(str(tr("INCORRECT"), ": ", Global.current_incorrect))
	
	if Global.next_disabled != false:
		get_node("Next").modulate.a = 0.0

	if Global.num_table == Global.data["MaxLevel"]:
		Global.data["MaxLevel"] += 1
	
	Persistence.save_data()
	
func _on_Back_pressed():
	get_tree().change_scene("res://src/MainScreens/Levels.tscn")

func _on_Resume_pressed():
	get_tree().change_scene("res://src/Levels/Level"
		+ str(Global.current_level) + ".tscn")

func _on_Next_pressed():
	Global.num_table=Global.num_table+1
	if Global.num_table > 9:
		get_node("Next").set_disabled(true)
		
	else:
		get_tree().change_scene("res://src/Levels/Level1.tscn")
	
