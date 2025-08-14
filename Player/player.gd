extends Node3D
var is_moving = false

const MOVE_DISTANCE = 2
var FORWARD_DIRECTION = -transform.basis.z.normalized()
var BACKWARD_DIRECTION = transform.basis.z.normalized()
var LEFT_DIRECTION = -transform.basis.x.normalized()
var RIGHT_DIRECTION = transform.basis.x.normalized()
@onready var move_timer = $Move_timer

@onready var ray_forward = $Raycasts/Forward
@onready var ray_backward = $Raycasts/Backward
@onready var ray_left = $Raycasts/Left
@onready var ray_right = $Raycasts/Right


func _ready() -> void:
	print("caca")


func _process(_delta: float) -> void:
	FORWARD_DIRECTION = -transform.basis.z.normalized()
	BACKWARD_DIRECTION = transform.basis.z.normalized()
	LEFT_DIRECTION = -transform.basis.x.normalized()
	RIGHT_DIRECTION = transform.basis.x.normalized()


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("forward"):
		move_forward()
	if Input.is_action_pressed("backward"):
		move_backward()
	if Input.is_action_pressed("left"):
		move_left()
	if Input.is_action_pressed("right"):
		move_right()
	if Input.is_action_pressed("turn_left"):
		turn_left()
	if Input.is_action_pressed("turn_right"):
		turn_right()


func move_forward():
	if !is_moving:
		
		#if path is blocked
		if ray_forward.is_colliding():
			print("path blocked")
			is_moving = true
			
			var col_point = ray_forward.get_collision_point()
			var old_pos = position
			
			var tween = create_tween()
			tween.tween_property(self, "position", Vector3(col_point.x,position.y,col_point.z), 0.2)
			await tween.finished
			
			#play bump sound
			
			tween = create_tween()
			tween.tween_property(self, "position", old_pos, 0.2)
			await tween.finished
			
			move_timer.start()
			await move_timer.timeout
			is_moving = false
		
		#if path is clear
		else:
			SignalManager.movement.emit()
			is_moving = true
			
			var tween = create_tween()
			tween.tween_property(self, "position", position + (FORWARD_DIRECTION*MOVE_DISTANCE), 0.2)
			await tween.finished
			
			move_timer.start()
			await move_timer.timeout
			is_moving = false

func move_backward():
	if !is_moving:
		
		#if path is blocked
		if ray_backward.is_colliding():
			print("path blocked")
			is_moving = true
			
			var col_point = ray_backward.get_collision_point()
			var old_pos = position
			
			var tween = create_tween()
			tween.tween_property(self, "position", Vector3(col_point.x,position.y,col_point.z), 0.2)
			await tween.finished
			
			#play bump sound
			
			tween = create_tween()
			tween.tween_property(self, "position", old_pos, 0.2)
			await tween.finished
			
			move_timer.start()
			await move_timer.timeout
			is_moving = false
		
		#if path is clear
		else:
			SignalManager.movement.emit()
			is_moving = true
			
			var tween = create_tween()
			tween.tween_property(self, "position", position + (BACKWARD_DIRECTION*MOVE_DISTANCE), 0.2)
			await tween.finished
			
			move_timer.start()
			await move_timer.timeout
			is_moving = false

func move_left():
	if !is_moving:
		
		#if path is blocked
		if ray_left.is_colliding():
			print("path blocked")
			is_moving = true
			
			var col_point = ray_left.get_collision_point()
			var old_pos = position
			
			var tween = create_tween()
			tween.tween_property(self, "position", Vector3(col_point.x,position.y,col_point.z), 0.2)
			await tween.finished
			
			#play bump sound
			
			tween = create_tween()
			tween.tween_property(self, "position", old_pos, 0.2)
			await tween.finished
			
			move_timer.start()
			await move_timer.timeout
			is_moving = false
		
		#if path is clear
		else:
			SignalManager.movement.emit()
			is_moving = true
			
			var tween = create_tween()
			tween.tween_property(self, "position", position + (LEFT_DIRECTION*MOVE_DISTANCE), 0.2)
			await tween.finished
			
			move_timer.start()
			await move_timer.timeout
			is_moving = false

func move_right():
	if !is_moving:
		
		#if path is blocked
		if ray_right.is_colliding():
			print("path blocked")
			is_moving = true
			
			var col_point = ray_right.get_collision_point()
			var old_pos = position
			
			var tween = create_tween()
			tween.tween_property(self, "position", Vector3(col_point.x,position.y,col_point.z), 0.2)
			await tween.finished
			
			#play bump sound
			
			tween = create_tween()
			tween.tween_property(self, "position", old_pos, 0.2)
			await tween.finished
			
			move_timer.start()
			await move_timer.timeout
			is_moving = false
		
		#if path is clear
		else:
			SignalManager.movement.emit()
			is_moving = true
			
			var tween = create_tween()
			tween.tween_property(self, "position", position + (RIGHT_DIRECTION*MOVE_DISTANCE), 0.2)
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
