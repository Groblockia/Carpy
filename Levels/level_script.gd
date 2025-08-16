extends Node3D

var minotaur_enabled = true



func _ready() -> void:
	SignalManager.player_dies.connect(_show_game_over)
	SignalManager.level_entered.emit()
	$Timer.start()

func _process(_delta: float) -> void:
	pass

func _show_game_over():
	print("showed game over")
	#SignalManager.player_dies.emit()
	var scene = load("res://Menus/game_over.tscn")
	var instance = scene.instantiate()
	add_child(instance)
	pass


func _on_timer_timeout() -> void:
	var minotaur = load("res://Enemies/minotaur.tscn")
	var instance = minotaur.instantiate()
	instance.position = Vector3(-45,0,-43)
	add_child(instance)


func _on_finish_area_area_entered(area: Area3D) -> void:
	get_tree().change_scene_to_file("res://Menus/finish_screen.tscn")
