extends "GenericTabla.gd"

# class member variables go here, for example:
 
# var b = "textvar"

func _ready():
	set_table(Global.num_table) # setiar la tabla del 1}
	var result_all = "Result_1"
	for i in range(1,11):
		get_node("Result_"+str(i)).set_text(str(Global.num_table*i))
		get_node("Multiplo").set_text(str(Global.num_table) + " x")

func _on_Button_pressed():
	get_tree().change_scene("res://src/MainScreens/Tables.tscn")

