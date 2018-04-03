extends Node2D

func _ready():
	pass

func _on_TimeSplash_timeout():
	get_tree().change_scene("res://src/MainScreens/Menu.tscn")

