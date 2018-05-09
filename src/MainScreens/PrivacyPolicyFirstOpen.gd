extends Node

func _on_Accept_pressed():
	Global.data["AcceptPrivacyPolicy"] = true
	Persistence.save_data(Global.current_user)
	
	Global.all_data_config()
	
	get_tree().change_scene("res://src/MainScreens/Menu.tscn")

func _on_No_pressed():
	get_tree().quit()
