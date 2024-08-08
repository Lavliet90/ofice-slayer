extends Node

@onready var player_stats = $BattleUI/PlayerStats
@onready var enemy_stats = $BattleUI/EnemyStats
@onready var action_buttons = $BattleUI/ActioButtons

var player_health = 100
var enemy_health = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_attack_pressed():
	enemy_health -= 10
	player_health -= 5
	update_stats()
	check_battle_status()

func _on_defend_pressed():
	pass
	
func _on_item_pressed():
	pass
	
func update_stats():
	player_stats.text = "Player HP: %d" % player_health
	enemy_stats.text = "Enemy HP: %d" % enemy_health
	
func check_battle_status():
	if enemy_health <= 0:
		print("Enemy defeated!")
		# Логика завершения боя
	elif player_health <= 0:
		print("Player defeated!")
		# Логика завершения боя

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
