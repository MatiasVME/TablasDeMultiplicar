extends Node2D

onready var game_music = GlobalMusic.get_node("Green_Hills")
onready var menu_music = GlobalMusic.get_node("Carnivalrides")

func _ready():
	if Global.music:
		menu_music.stop()
		game_music.play()
		

func _on_ExitLevel_pressed():
	get_tree().change_scene("res://src/MainScreens/Levels.tscn")

func _on_Opt1_pressed():
	Global.reset_opt()
	Global.opt1_pressed = true

func _on_Opt2_pressed():
	Global.reset_opt()
	Global.opt2_pressed = true

func _on_Opt3_pressed():
	Global.reset_opt()
	Global.opt3_pressed = true

