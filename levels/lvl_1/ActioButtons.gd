extends VBoxContainer

signal action_selected(action: String)

func _ready():
	pass

		
func _on_button_pressed_wrapper(button: Button):
	_on_button_pressed(button)
	
	
func _on_button_pressed(button):
	var action = button.text
	emit_signal("action_selected", action)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
