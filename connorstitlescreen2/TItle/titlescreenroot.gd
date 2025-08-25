extends Node3D

@export var bounds_half_extent_x: float = 12.0
@export var bounds_half_extent_y: float = 8.0
@export var bounds_half_extent_z: float = 20.0
@export var wall_thickness: float = 0.5

func _ready():
	_build_bounds()

func _build_bounds():
	# Left/Right
	make_wall(Vector3(-bounds_half_extent_x, 0, 0), Vector3(wall_thickness, bounds_half_extent_y, bounds_half_extent_z), "Wall_Left")
	make_wall(Vector3(+bounds_half_extent_x, 0, 0), Vector3(wall_thickness, bounds_half_extent_y, bounds_half_extent_z), "Wall_Right")
	# Bottom/Top
	make_wall(Vector3(0, -bounds_half_extent_y, 0), Vector3(bounds_half_extent_x, wall_thickness, bounds_half_extent_z), "Wall_Bottom")
	make_wall(Vector3(0, +bounds_half_extent_y, 0), Vector3(bounds_half_extent_x, wall_thickness, bounds_half_extent_z), "Wall_Top")
	# Front/Back
	make_wall(Vector3(0, 0, -bounds_half_extent_z), Vector3(bounds_half_extent_x, bounds_half_extent_y, wall_thickness), "Wall_Front")
	make_wall(Vector3(0, 0, +bounds_half_extent_z), Vector3(bounds_half_extent_x, bounds_half_extent_y, wall_thickness), "Wall_Back")

func make_wall(pos: Vector3, size: Vector3, name: String):
	var body := StaticBody3D.new()
	body.name = name
	body.transform.origin = pos

	var shape := BoxShape3D.new()
	shape.size = size * 2.0  # BoxShape3D expects full extents

	var col := CollisionShape3D.new()
	col.shape = shape
	body.add_child(col)

	if not has_node("Bounds"):
		var bounds_node := Node3D.new()
		bounds_node.name = "Bounds"
		add_child(bounds_node)

	$Bounds.add_child(body)
