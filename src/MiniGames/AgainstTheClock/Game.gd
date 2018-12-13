extends "GenericATC.gd"

const MAX_TIME = 60

onready var display = get_node("Template/Display")
onready var opt1_text = get_node("Template/Opt1/Num")
onready var opt2_text = get_node("Template/Opt2/Num")
onready var opt3_text = get_node("Template/Opt3/Num")
onready var points = get_node("Template/Points")
onready var time = get_node("Template/Time")

var opt_one_time = true
var end_level_one_time = true
var game_over_one_time = true

var time_acum = 0

func _ready():
#	set_table(Global.num_table) # setiar la tabla del 1
	Global.current_points = 0
#	Global.current_incorrect = 0
#	Global.current_stay = 20
	#Global.current_stay = 2

	show_new_problem()
	
	set_process(true)

func _process(delta):
	if Global.opt1_pressed and opt_one_time:
		opt_one_time = false
		var opt = int(opt1_text.get_text())
		evaluate_result(opt)
		show_new_problem()
	elif Global.opt2_pressed and opt_one_time:
		opt_one_time = false
		var opt = int(opt2_text.get_text())
		
		evaluate_result(opt)
		show_new_problem()
	elif Global.opt3_pressed and opt_one_time:
		opt_one_time = false
		var opt = int(opt3_text.get_text())
		
		evaluate_result(opt)
		show_new_problem()
	
#	if Global.current_correct >= 19 and end_level_one_time:
#		end_level_one_time = false
#
#		get_tree().change_scene("res://src/MiniGames/AgainstTheClock/Win.tscn")
#
#	if Global.current_incorrect >= 3 and game_over_one_time:
#		game_over_one_time = false
#		get_tree().change_scene("res://src/Levels/GameOver.tscn")

func display_problem():
	display.text = str(num1, " * ", num2)

func show_opts():
	opt1_text.set_text(str(opts[0]))
	opt2_text.set_text(str(opts[1]))
	opt3_text.set_text(str(opts[2]))
	
func show_points():
	points.text = str("Puntos: ", Global.current_points)
	
func show_new_problem():
	new_problem()
	display_problem()
	generate_answers()
	show_opts()
	show_points()
	opt_one_time = true
	
func _on_Timer_timeout():
	time_acum += 1
	
	time.text = str("Tiempo: ", MAX_TIME - time_acum)
	
	if time_acum >= MAX_TIME:
		get_tree().change_scene("res://src/MiniGames/AgainstTheClock/Win.tscn")
