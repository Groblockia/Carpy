extends CharacterBody3D

var speed = 3

var grid_pos = Vector2(0,0)
var current_point


@onready var pathfind: GridMapPathFinding = get_parent().get_node("GridMapPathFinding")
@onready var player = get_tree().get_first_node_in_group("player_group")

@onready var start_cell = world_to_grid_pos(position)
@onready var end_cell = world_to_grid_pos(player.position)


var path: Array = []
var current_index := 1

var time_since_last_path := 0.0
const PATH_INTERVAL := 0.5

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	look_at(player.position)

func _physics_process(delta: float) -> void:
	update_path()
	follow_path(delta)

func world_to_grid_pos(world_pos: Vector3) -> Vector3i:
	return Vector3i(floor(world_pos.x/2), 0, floor(world_pos.z/2))

func update_path():
	# Get positions in grid space
	var enemy_pos = world_to_grid_pos(position)
	var player_pos = world_to_grid_pos(player.position)
	
	var grid_path = pathfind.find_path(enemy_pos, player_pos)
	if grid_path.is_empty():
		print("grid_path is empy")
		return
	
	# Convert to world-space waypoints
	path.clear()
	for point in grid_path:
		path.append(pathfind.map_to_local(point))
	
	#current_index = 0

func follow_path(_delta):
	if path.is_empty() or current_index >= path.size():
		print("path is empty")
		return
	
	var target_pos: Vector3 = path[current_index]
	var direction = (target_pos - global_transform.origin).normalized()
	var distance = global_transform.origin.distance_to(target_pos)
	print(target_pos)
	
	if distance < 0.1:
		print("distance<0.1")
		current_index += 1
		return
	
	velocity = direction * speed
	move_and_slide()
