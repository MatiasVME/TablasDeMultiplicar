extends Node

var fpath = "user://savegame.txt"
# Contiene toda la data al ser cargada con load_game()
var all_data = {}

var is_loaded = false

# Retorna el diccionario con todos los datos que son almacenados
func create_data():
	var save_dict = {
		MaxLevel = 1
	}
	
	return save_dict

# Guarda el archivo
func save_game():
	var savegame = File.new()
	
	if (!savegame.file_exists(fpath)):
		all_data = create_data()
	
	savegame.open(fpath, File.WRITE)
	#savegame.open_encrypted_with_pass(fpath, File.WRITE, OS.get_unique_ID())

	savegame.store_line(to_json(all_data))
	
	savegame.close()
	
# Carga el archivo
func load_game():
	is_loaded = true
	
	# Instancia el fichero
	var savegame = File.new()
	# Verifica si el fichero no existe
	if (!savegame.file_exists(fpath)):
		return

	# Diccionario en el cual se va a almacenar los datos
	var dict = {}
	
	# Abre el fichero
	savegame.open(fpath, File.READ)
	#savegame.open_encrypted_with_pass(fpath, File.WRITE, OS.get_unique_ID())
	
	# Se lee linea por linea y se pasa a json
	dict = parse_json(savegame.get_line())
	
	# Se cierra el fichero
	savegame.close()
	
	# La data se almacena en un diccionario
	all_data = dict

func file_exist():
	# Instancia el fichero
	var savegame = File.new()
	# Verifica si el fichero no existe
	if (savegame.file_exists(fpath)):
		return true
	else:
		return false
