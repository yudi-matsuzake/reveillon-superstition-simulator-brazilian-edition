extends Node2D

var file_manager = File.new()
var save_path = "user://highscore.save"
var highscore_data = {
					"name" : "",
					"highscore" : 0
					}

func _ready():
	pass

func set_highscore(name, highscore):
	highscore_data["name"] = name
	highscore_data["highscore"] = highscore #data to save
	file_manager.open(save_path, File.WRITE) #open file to write
	file_manager.store_var(highscore_data) #store the data
	file_manager.close() # close the file

func get_highscore():
	if not file_manager.file_exists(save_path):
		create_save()
		return highscore_data
	file_manager.open(save_path, File.READ) #open the file
	var save_data = file_manager.get_var() #get the value
	file_manager.close() #close the file

	return save_data

func create_save():
   file_manager.open(save_path, File.WRITE)
   file_manager.store_var(highscore_data)
   file_manager.close()

func check_and_save_highscore(name, highscore):
	var stored_highscore = get_highscore()
	
	if ( int(stored_highscore["highscore"]) < highscore):
		set_highscore(name, highscore)