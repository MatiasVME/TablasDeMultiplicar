extends Node

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

func reset_opt():
	opt1_pressed = false
	opt2_pressed = false
	opt3_pressed = false

func _ready():
	var data = Persistence.get_data()

	if not data.has("MaxLevel"):
		data["MaxLevel"] = 1
		
	Persistence.save_data()