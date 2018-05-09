extends "GenericLevel.gd"

onready var display = get_node("LevelTemplate/Display")
onready var opt1_text = get_node("LevelTemplate/Opt1/Num")
onready var opt2_text = get_node("LevelTemplate/Opt2/Num")
onready var opt3_text = get_node("LevelTemplate/Opt3/Num")
onready var correct = get_node("LevelTemplate/Correct")
onready var incorrect = get_node("LevelTemplate/Incorrect")
onready var stay = get_node("LevelTemplate/Stay")

var opt_one_time = true
var end_level_one_time = true
var game_over_one_time = true

func _ready():
	set_table(Global.num_table) # setiar la tabla del 1}
	Global.current_level = 1
	Global.current_correct = 0
	Global.current_incorrect = 0
	Global.current_stay = 20
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
	
	if Global.current_stay == 0 and end_level_one_time:
		end_level_one_time = false
		
		randomize()
		var rand_num = int(round(rand_range(0, 4)))
		
		if rand_num <= 1 and Global.firebase != null:
			Global.firebase.show_interstitial_ad()
		
		get_tree().change_scene("res://src/Levels/EndLevel.tscn")
		
	if Global.current_incorrect >= 3 and game_over_one_time:
		game_over_one_time = false
		get_tree().change_scene("res://src/Levels/GameOver.tscn")

func display_problem():
	display.set_text(str(num1, " * ", num2))

func show_opts():
	opt1_text.set_text(str(opts[0]))
	opt2_text.set_text(str(opts[1]))
	opt3_text.set_text(str(opts[2]))
	
func show_correct():
	correct.set_text(str("Correctas: ", Global.current_correct))

func show_incorrect():
	incorrect.set_text(str("Incorrectas: ", Global.current_incorrect))
	
func show_stay():
	stay.set_text(str("Quedan: ", Global.current_stay))
	
func show_new_problem():
	new_problem()
	display_problem()
	generate_answers()
	show_opts()
	show_correct()
	show_incorrect()
	show_stay()
	opt_one_time = true
	
