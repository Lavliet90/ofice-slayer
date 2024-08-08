extends CanvasLayer

@onready var color_rect = $ColorRect
@export var fade_duration = 1.0

func _ready():
	color_rect.color.a = 0 
	color_rect.visible = true

func fade_out(callback: Callable):
	var tween = get_tree().create_tween()
	tween.tween_property(color_rect, "color:a", 1, fade_duration)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN)
	await tween.finished
	callback.call()

