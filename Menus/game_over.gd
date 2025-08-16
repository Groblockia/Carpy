extends Control

@onready var restart_btn = $VBoxContainer/HBoxContainer/VBoxContainer/Restart_btn
@onready var quit_btn = $VBoxContainer/HBoxContainer/VBoxContainer/Quit_btn

func _ready():
	$AudioStreamPlayer2D.play()

func _on_restart_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")

func _on_quit_btn_pressed() -> void:
	get_tree().quit()
