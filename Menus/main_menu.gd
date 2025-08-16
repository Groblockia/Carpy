extends Control

@onready var start_btn = $VBoxContainer/HBoxContainer/VBoxContainer/Start_btn
@onready var exit_btn = $VBoxContainer/HBoxContainer/VBoxContainer/Exit_btn

func _process(delta: float) -> void:
	pass


func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")


func _on_exit_btn_pressed() -> void:
	get_tree().quit()
