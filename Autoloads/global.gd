extends Node

func _ready():
	SignalManager.movement.connect(cacapipi)

func cacapipi():
	print("c'est le mec il suce le cul d'une pute")
