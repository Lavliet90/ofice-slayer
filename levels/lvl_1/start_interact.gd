extends Node2D

@onready var interaction_area: InteractionArea = $interaction_area
@onready var player = $"../player"
@onready var sprite = $Sprite2D
@onready var fade_out_scene = preload("res://interface/visual_effects/fade_out_screen.tscn")


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	var fade_out_instance = fade_out_scene.instantiate()
	get_tree().current_scene.add_child(fade_out_instance)
	if fade_out_instance is CanvasLayer:
		var fade_out_screen = fade_out_instance as CanvasLayer
		get_tree().current_scene.add_child(fade_out_instance)
		await fade_out_screen.fade_out(Callable(self, "_change_scene"))
	else:
		print("Error: Instance is not of type CanvasLayer or 'fade_out' method not found.")
	
	fade_out_instance.fade_out(Callable(self, "_change_scene"))

func _change_scene():
	pass
	# get_tree().change_scene_to_file("res://interface/menu.tscn")
