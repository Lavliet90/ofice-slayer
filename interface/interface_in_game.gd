extends CanvasLayer


@onready var pause_menu = $PauseMenu
@onready var screen_dimming = $ScreenDimming
@onready var button_save = $PauseMenu/Panel/VBoxContainer/Save
@onready var button_load = $PauseMenu/Panel/VBoxContainer/Load
@onready var player = get_tree().get_first_node_in_group("players")


var save_path = "user://savegame.save"
var current_scene = ""
var game_paused: bool = false

signal update_buttons(scene_name: String)

func _ready():
	print('Connecting signal...')
	connect("update_buttons", Callable(self, "_on_update_buttons"))
	print('Signal connected.')
	

func _on_update_buttons(scene_name):
	print("Signal received. Scene: %s" % scene_name)
	if scene_name == "Computer_killer":
		button_save.hide()
		button_load.hide()
	else:
		button_save.show()
		button_load.show()
		
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
		
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
		screen_dimming.show()
		
	else:
		get_tree().paused = false
		pause_menu.hide()
		screen_dimming.hide()


func _on_resume_pressed():
	game_paused = !game_paused


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://interface/menu.tscn")


func _on_menu_button_pressed():
	game_paused = !game_paused


func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(player.position.x)
	file.store_var(player.position.y)
	
func loas_game():
	var file = FileAccess.open(save_path, FileAccess.READ)
	#global.gold = file.get_var(Global.gold)
	player.position.x = file.get_var(player.position.x)
	player.position.y = file.get_var(player.position.y)
	

func _on_save_pressed():
	save_game()
	game_paused = !game_paused


func _on_load_pressed():
	loas_game()
	game_paused = !game_paused
