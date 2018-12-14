extends Node

const DATA_VERSION = 0

var debug = true
var version = "2.3.0"

var current_level = 1
var current_points = 0 # Para contra el reloj
var current_correct = 0
var current_incorrect = 0
var current_stay = 0

var num_table = 1

var next_disabled = false

var music = true

var opt1_pressed = false
var opt2_pressed = false
var opt3_pressed = false

#var firebase
#var google
var data

func reset_opt():
	opt1_pressed = false
	opt2_pressed = false
	opt3_pressed = false

func _ready():
	# Para tests
	if debug:
#		Persistence.remove_all_data()
		Persistence.mode = Persistence.Mode.MODE_TEXT
	else:
		Persistence.mode = Persistence.Mode.MODE_ENCRYPTED
		
	data = Persistence.get_data()

	# Tiene data version
	if data.has("DataVersion"):
		if data["DataVersion"] != DATA_VERSION:
			Persistence.remove_all_data()
			
			data["DataVersion"] = DATA_VERSION
			Persistence.save_data()
			
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
	
	Persistence.save_data()

func all_data_config():
	create_data_if_not_exist()
		
func create_data_if_not_exist():
	if not data.has("ATCScoreRecord"):
		data["MaxLevel"] = 1
		# against the clock = ATC
		data["ATCScoreRecord"] = 0
		
		Persistence.save_data()