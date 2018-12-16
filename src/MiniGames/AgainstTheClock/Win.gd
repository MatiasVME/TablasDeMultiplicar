extends Node2D

#var AID = preload("res://AchievementsIDs.gd").ATC

onready var points = get_node("Some/Points")
onready var record = get_node("Some/Record")

func _ready():
	if not Global.data.has("ATCScoreRecord"):
		Global.data["ATCScoreRecord"] = 0
	
	if Global.data["ATCScoreRecord"] < Global.current_points:
		Global.data["ATCScoreRecord"] = Global.current_points
		Persistence.save_data()
		
#	if Global.google != null:
#		Global.google.submit_leaderboard(int(Global.data["ATCScoreRecord"]), AID)
		
#	randomize()
#	var rand_num = int(round(rand_range(0, 3)))
#
#	if rand_num <= 1 and Global.firebase != null:
#		Global.firebase.show_interstitial_ad()
	
	points.set_text(str(tr("POINTS"), ": ", Global.current_points))
	record.set_text(str(tr("RECORD"), ": ", Global.data["ATCScoreRecord"]))
	
func _on_Back_pressed():
	get_tree().change_scene("res://src/MainScreens/Menu.tscn")

func _on_Resume_pressed():
	get_tree().change_scene("res://src/MiniGames/AgainstTheClock/Game.tscn")

#func _on_Leaderboard_pressed():
#	Global.google.show_leaderboard(AID)
