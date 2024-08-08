extends Node2D

@onready var interaction_area: InteractionArea = $interaction_area
@onready var sprite = $Sprite2D


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_interact():
	get_tree().change_scene_to_file("res://levels/lvl_1/computer_killer.tscn")
