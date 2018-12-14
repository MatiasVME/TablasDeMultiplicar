extends Node

func _on_Accept_pressed():
	Global.data["AcceptPrivacyPolicy"] = true
	Persistence.save_data()
	
	Global.all_data_config()
#	Global.google_play_service()
	
	get_tree().change_scene("res://src/MainScreens/Menu.tscn")

func _on_No_pressed():
	get_tree().quit()
