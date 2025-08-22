extends Node3D

@export var bounds_half_extent: float = 10.0   # cube from -10..+10 in X,Y,Z
@export var wall_thickness: float = 0.5

func _ready():
	_build_bounds()

func _build_bounds():
	var b = bounds_half_extent
	var t = wall_thickness

	# Left/Right
	make_wall(Vector3(-b, 0, 0), Vector3(t, b, b), "Wall_Left")
	make_wall(Vector3(+b, 0, 0), Vector3(t, b, b), "Wall_Right")
	# Bottom/Top
	make_wall(Vector3(0, -b, 0), Vector3(b, t, b), "Wall_Bottom")
	make_wall(Vector3(0, +b, 0), Vector3(b, t, b), "Wall_Top")
	# Front/Back
	make_wall(Vector3(0, 0, -b), Vector3(b, b, t), "Wall_Front")
	make_wall(Vector3(0, 0, +b), Vector3(b, b, t), "Wall_Back")

func make_wall(pos: Vector3, size: Vector3, name: String):
	var body := StaticBody3D.new()
	body.name = name
	body.transform.origin = pos

	var shape := BoxShape3D.new()
	shape.size = size * 2.0   # BoxShape3D takes full extents, not half

	var col := CollisionShape3D.new()
	col.shape = shape
	body.add_child(col)

	if not has_node("Bounds"):
		var bounds_node := Node3D.new()
		bounds_node.name = "Bounds"
		add_child(bounds_node)

	$Bounds.add_child(body)
