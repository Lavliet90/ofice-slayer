extends "res://entity/enemy/base_attack.gd"


@onready var sprite = $Sprite
@onready var collision_shape = $CollisionShape2D

@export var speed: float = 200.0

var direction: Vector2 = Vector2(0, 1)


func _ready():
	direction = Vector2(0, 1) 

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	print('KOK5')
	if body.is_in_group("players"):
		print('KOK6')
		body.take_damage()
		queue_free()
