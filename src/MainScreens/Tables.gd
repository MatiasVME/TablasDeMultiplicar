extends Node2D

func _on_volver_pressed():
	get_tree().change_scene("res://src/MainScreens/Menu.tscn")

func _on_Tabla1_pressed():
	Global.num_table = 1
	new_view()

func _on_Tabla2_pressed():
	Global.num_table = 2
	new_view()

func _on_Tabla3_pressed():
	Global.num_table = 3
	new_view()

func _on_Tabla4_pressed():
	Global.num_table = 4
	new_view()

func _on_Tabla5_pressed():
	Global.num_table = 5
	new_view()

func _on_Tabla6_pressed():
	Global.num_table = 6
	new_view()

func _on_Tabla7_pressed():
	Global.num_table = 7
	new_view()

func _on_Tabla8_pressed():
	Global.num_table = 8
	new_view()

func _on_Tabla9_pressed():
	Global.num_table = 9
	new_view()

func new_view():
	get_tree().change_scene("res://src/Tables/Tabla.tscn")
