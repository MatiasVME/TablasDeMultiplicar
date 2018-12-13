extends Node2D

func _ready():
	activate_levels()
	pass
	
func activate_levels():
	var levels = get_tree().get_nodes_in_group("Levels")
	var count = 0
	
	var data = Persistence.get_data()
	
	for i in range(0, levels.size()):
		count += 1
#		i.set_disabled(false)
		levels[i].disabled = false
		if count == Global.data["MaxLevel"]:
			break

func _on_Back_pressed():
	get_tree().change_scene("res://src/MainScreens/Menu.tscn")

func _on_Level1_pressed():
	Global.num_table = 1	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level2_pressed():
	Global.num_table = 2	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level3_pressed():
	Global.num_table = 3	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level4_pressed():
	Global.num_table = 4	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level5_pressed():
	Global.num_table = 5	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level6_pressed():
	Global.num_table = 6	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level7_pressed():
	Global.num_table = 7	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level8_pressed():
	Global.num_table = 8	
	get_tree().change_scene("res://src/Levels/Level1.tscn")

func _on_Level9_pressed():
	Global.num_table = 9	
	Global.next_disabled = true
	get_tree().change_scene("res://src/Levels/Level1.tscn")

