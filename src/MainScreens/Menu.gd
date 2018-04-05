extends Node2D

var sonido_on = load("res://assets/images/buttons/sound-on.png")
var sonido_off = load("res://assets/images/buttons/sound-off.png")

onready var menu_music = GlobalMusic.get_node("Carnivalrides")
onready var game_music = GlobalMusic.get_node("Green_Hills")

var load_or_save_one_time = true

# Test AdMob
var admob = null
var isReal = true
var isTop = true
var adBannerId = "ca-app-pub-7855556025507535/9362038567" # [Replace with your Ad Unit ID and delete this message.]
#var adInterstitialId = "ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX" # [Replace with your Ad Unit ID and delete this message.]
#var adRewardedId = "ca-app-pub-7855556025507535/6165029588" # [There is no testing option for rewarded videos, so you can use this id for testing]

func _ready():
	if Global.music == false:
		get_node("Sound").set_normal_texture(sonido_off)
		get_node("Sound").set_pressed_texture(sonido_on)
		
#	if (load_or_save_one_time):
#		load_or_save_one_time = false
#
#		if (GlobalSave.file_exist()):
#			GlobalSave.load_game()
#		else:
#			GlobalSave.save_game()
	
	if(Engine.has_singleton("AdMob")):
			admob = Engine.get_singleton("AdMob")
			admob.init(isReal, get_instance_id())
			loadBanner()
			#loadInterstitial()
#			loadRewardedVideo()

func loadBanner():
	if admob != null:
		admob.loadBanner(adBannerId, isTop)

#func loadInterstitial():
#	if admob != null:
#		admob.loadInterstitial(adInterstitialId)
#
#func loadRewardedVideo():
#	if admob != null:
#		admob.loadRewardedVideo(adRewardedId)

func _on_Start_pressed():
	get_tree().change_scene("res://src/MainScreens/Levels.tscn")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Team_pressed():
	get_tree().change_scene("res://src/MainScreens/Credits.tscn")

func _on_Tables_pressed():
	get_tree().change_scene("res://src/MainScreens/Tables.tscn")

func _on_Sound_pressed():
	
	if Global.music:
		get_node("Sound").set_normal_texture(sonido_off)
		get_node("Sound").set_pressed_texture(sonido_on)
		Global.music = false
		menu_music.stop()
		game_music.stop()
	else:
		menu_music.play()
		get_node("Sound").set_normal_texture(sonido_on)
		get_node("Sound").set_pressed_texture(sonido_off)
		Global.music = true
