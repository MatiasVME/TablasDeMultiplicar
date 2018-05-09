extends Node

const DATA_VERSION = 1

var debug = true
var version = "2.1.0"

var current_user

var current_level = 1
var current_points = 0
var current_correct = 0
var current_incorrect = 0
var current_stay = 0

var num_table = 1

var next_disabled = false

var music = true

var opt1_pressed = false
var opt2_pressed = false
var opt3_pressed = false

var firebase
var data

func reset_opt():
	opt1_pressed = false
	opt2_pressed = false
	opt3_pressed = false

func _ready():
#	var data = Persistence.get_data()
#
#	if not data.has("MaxLevel"):
#		data["MaxLevel"] = 1
#
#	Persistence.save_data()
#
#	firebase_config()

	# Para tests
	if debug:
#		Persistence.remove_all_data()
		Persistence.mode = Persistence.MODE_TEXT
	else:
		Persistence.mode = Persistence.MODE_ENCRYPTED
		
	# Método que obtiene el usuario dependiendo si esta logeado o no, o si
	# a aceptado las políticas de privacidad.
	# current_user = get_current_user()  
	
	data = Persistence.get_data(current_user)

	# Tiene data version
	if data.has("DataVersion"):
		if data["DataVersion"] != DATA_VERSION:
			Persistence.remove_all_data()
			
			data["DataVersion"] = DATA_VERSION
			Persistence.save_data(current_user)
			
			get_tree().quit()
		else:
			if not data.has("AcceptPrivacyPolicy"):
				data["AcceptPrivacyPolicy"] = false
			else:
				all_data_config()
	# No hay data version es un nuevo usuario o un usuario antiguo
	else:
		data["DataVersion"] = DATA_VERSION
		
		if not data.has("AcceptPrivacyPolicy"):
			data["AcceptPrivacyPolicy"] = false
		elif data["AcceptPrivacyPolicy"]:
			all_data_config()
	
	Persistence.save_data(current_user)

func get_current_user():
	if data["AcceptPrivacyPolicy"]:
		pass

func all_data_config():
	firebase_config()
	create_data_if_not_exist()

func firebase_config():
	if OS.get_name() == "Android":
		firebase = Engine.get_singleton("FireBase")
		var file = File.new()
		file.open("res://godot-firebase-config.json", file.READ)
		var content = file.get_as_text()
		file.close()
		
		firebase.init(content, get_instance_id())
		
func create_data_if_not_exist():
	if not data.has("ATCScoreRecord"):
		data["MaxLevel"] = 1
		# against the clock = ATC
		data["ATCScoreRecord"] = 0
		
		
		
