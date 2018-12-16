extends Node2D

var sonido_on = load("res://assets/images/buttons/sound-on.png")
var sonido_off = load("res://assets/images/buttons/sound-off.png")

onready var menu_music = GlobalMusic.get_node("Carnivalrides")
onready var game_music = GlobalMusic.get_node("Green_Hills")

var load_or_save_one_time = true

func _ready():
	if Global.music == false:
		get_node("Sound").set_normal_texture(sonido_off)
		get_node("Sound").set_pressed_texture(sonido_on)
		
	$Tables/TablesLabel.text = tr("TABLES")
	$Start/StartLabel.text = tr("START")
	$Clock/StartLabel.text = tr("TIME_TRIAL")
		
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

func _on_WelcomeMessage_meta_clicked(meta):
	OS.shell_open(meta)

func _on_PrivacyButton_pressed():
	get_tree().change_scene("res://src/MainScreens/PrivacyPolicy.tscn")

func _on_Clock_pressed():
	get_tree().change_scene("res://src/MiniGames/AgainstTheClock/Game.tscn")

