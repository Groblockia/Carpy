extends Node3D
var is_moving = false

const MOVE_DISTANCE = 2
@onready var move_timer = $Move_timer


func _ready() -> void:
	print("caca")


func _process(_delta: float) -> void:
	pass


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("forward"):
		move_fwd()
	if Input.is_action_pressed("backward"):
		move_bwd()
	if Input.is_action_pressed("turn_left"):
		turn_left()
	if Input.is_action_pressed("turn_right"):
		turn_right()


func move_fwd():
	if !is_moving:
		SignalManager.movement.emit()
		is_moving = true
		var direction = -transform.basis.z.normalized()
		var tween = create_tween()
		tween.tween_property(self, "position", position + (direction*MOVE_DISTANCE), 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false


func move_bwd():
	if !is_moving:
		SignalManager.movement.emit()
		is_moving = true
		var direction = transform.basis.z.normalized()
		var tween = create_tween()
		tween.tween_property(self, "position", position + (direction*MOVE_DISTANCE), 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false


func turn_left():
	if !is_moving:
		SignalManager.movement.emit()
		is_moving = true
		var tween = create_tween()
		tween.tween_property(self, "rotation:y", rotation.y + PI/2, 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false


func turn_right():
	if !is_moving:
		SignalManager.movement.emit()
		is_moving = true
		var tween = create_tween()
		tween.tween_property(self, "rotation:y", rotation.y - PI/2, 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false
