extends "res://entity/player/player.gd"


@onready var collision_shape = $CollisionShape2D
var health = 100


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
	
	
func _on_body_entered(body):
	if body.is_in_group("attack"):
		take_damage()

func take_damage(amount: int = 1000):
	health -= amount
	if health <= 0:
		die()

func die():
	# Логика смерти игрока
	queue_free()
