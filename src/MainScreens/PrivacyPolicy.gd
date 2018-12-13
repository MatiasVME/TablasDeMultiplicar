extends Node

func _ready():
	if Global.firebase != null:
		Global.firebase.show_banner_ad(false)

func _on_Back_pressed():
	if Global.firebase != null:
		Global.firebase.show_banner_ad(true)
	
	get_tree().change_scene("res://src/MainScreens/Menu.tscn")
