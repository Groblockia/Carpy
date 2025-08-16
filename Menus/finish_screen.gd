extends Control

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func _on_quit_btn_pressed() -> void:
	get_tree().quit()
