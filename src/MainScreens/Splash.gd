extends Node2D

func _on_TimeSplash_timeout():
	if Global.data["AcceptPrivacyPolicy"]:
		get_tree().change_scene("res://src/MainScreens/Menu.tscn")
	else:
		get_tree().change_scene("res://src/MainScreens/PrivacyPolicyFirstOpen.tscn")
