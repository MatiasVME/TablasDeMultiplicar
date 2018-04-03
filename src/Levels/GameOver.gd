extends Node2D

func _on_Back_pressed():
	get_tree().change_scene("res://src/MainScreens/Levels.tscn")

func _on_Resume_pressed():
	get_tree().change_scene("res://src/Levels/Level"
		+ str(Global.current_level) + ".tscn")

