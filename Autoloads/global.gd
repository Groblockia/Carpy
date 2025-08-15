extends Node


func _ready():
	SignalManager.player_moved.connect(_player_movement)

func _player_movement():
	pass
