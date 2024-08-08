extends Node2D

@onready var vbox_container = $interface_in_game
# Called when the node enters the scene tree for the first time.
func _ready():
	print('KOK2')
	vbox_container.emit_signal("update_buttons", get_tree().current_scene.name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
