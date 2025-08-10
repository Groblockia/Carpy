extends Node3D
var is_moving = false


@onready var move_timer = $Move_timer


func _ready() -> void:
	print("caca")

func _process(delta: float) -> void:
	#print("position = ", "(" , roundf(position.x) , "," , roundf(position.y) , "," , roundf(position.z) , ")")
	print("rotation = ", "(" , roundf(rad_to_deg(rotation.x)) , "," , roundf(rad_to_deg(rotation.y)) , "," , roundf(rad_to_deg(rotation.z)) , ")")

func _physics_process(_delta: float) -> void:
	move()

func move():
	if Input.is_action_pressed("forward") and not is_moving:
		is_moving = true
		var direction = -transform.basis.z.normalized()
		var tween = create_tween()
		tween.tween_property(self, "position", position + (direction*1), 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false
	
	if Input.is_action_pressed("backward") and not is_moving:
		is_moving = true
		var direction = transform.basis.z.normalized()
		var tween = create_tween()
		tween.tween_property(self, "position", position + (direction*1), 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false

	
	if Input.is_action_pressed("turn_left") and not is_moving:
		is_moving = true
		var tween = create_tween()
		tween.tween_property(self, "rotation:y", rotation.y + PI/2, 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false
	
	if Input.is_action_pressed("turn_right") and not is_moving:
		is_moving = true
		var tween = create_tween()
		tween.tween_property(self, "rotation:y", rotation.y - PI/2, 0.2)
		await tween.finished
		move_timer.start()
		await move_timer.timeout
		is_moving = false
	
