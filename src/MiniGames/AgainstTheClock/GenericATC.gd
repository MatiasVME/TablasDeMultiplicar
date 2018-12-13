extends Node

onready var win_sound = GlobalMusic.get_node("Win")
onready var lose_sound = GlobalMusic.get_node("Lose")

var num1 = 0
var num2 = 0
var result = 0
# Es el resultado anterior para que no se repitan los números continuamente
var past_result = 0
# Falsas alternativas
var falt = [0, 0]
# Opciones para elegir
var opts = []

# Cercanía respecto al resultado de las falsas alternativas
const NEARNESS = 5

func _ready():
	randomize()

func new_problem():
	num1 = int(round(rand_range(1, 9)))
	num2 = int(round(rand_range(1, 9)))

	result = num1 * num2

func generate_answers():
	# Definir el rango de de las falsas alternativas (falt)
	
	falt[0] = num_rand(0, 1)
	falt[1] = num_rand(1, 1)
	
	while (falt[0] == result):
		falt[0] = num_rand(0, 1)
	while (falt[1] == result || falt[1] == falt[0]):
		falt[1] = num_rand(1, 1)
	
	opts = [null, null, null]
	var opt_correct = int(rand_range(0, 3))
	
	opts[opt_correct] = result
	
	var index_falt = 0
	var index_num = 0
	
	for i in opts:
		if (i == null):
			opts[index_num] = falt[index_falt]
			index_falt += 1
		index_num += 1
		
		if (opts[0] == opts[1]):
			pass
	
func evaluate_result(opt):
	if opt == result:
		Global.current_correct += 1
		if Global.music:
			win_sound.play()
		Global.current_points += 10
	else:
		Global.current_incorrect += 1
		if Global.music:
			lose_sound.play()
		Global.current_points -= 20

	Global.reset_opt()
	
func num_rand(num, c):
	var n = int(rand_range(result - NEARNESS, result + NEARNESS + 1))
	if n < 0:
		n = n*-1
		print(str(num)," es negativo ", n)
	return n
