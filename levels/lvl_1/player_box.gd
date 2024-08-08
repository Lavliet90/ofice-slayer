extends CharacterBody2D

const SPEED = 200.0

	
func _physics_process(delta):
	var direction = Vector2()
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	if direction != Vector2():
		direction = direction.normalized()
	
	# Устанавливаем скорость на основе направления
	velocity = direction * SPEED
	
	# Используем move_and_slide для перемещения и обработки столкновений
	move_and_slide()
