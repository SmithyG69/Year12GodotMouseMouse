extends RigidBody3D

@export var initial_speed: float = 6.0
@export var random_spin: float = 6.0
@export var min_scale: float = 0.85
@export var max_scale: float = 1.15

func _ready():
	# Random scale & rotation
	var s = randf_range(min_scale, max_scale)
	scale = Vector3.ONE * s
	rotation = Vector3(randf_range(0.0, TAU), randf_range(0.0, TAU), randf_range(0.0, TAU))

	# Physics settings
	continuous_cd = true
	can_sleep = false
	linear_damp = 0.0
	angular_damp = 0.0
	gravity_scale = 0.0  # zero G

	# Initial motion
	linear_velocity = Vector3(
		randf_range(-initial_speed, initial_speed),
		randf_range(-initial_speed, initial_speed),
		randf_range(-initial_speed, initial_speed)
	)
	angular_velocity = Vector3(
		randf_range(-random_spin, random_spin),
		randf_range(-random_spin, random_spin),
		randf_range(-random_spin, random_spin)
	)

	# PhysicsMaterial override
	var mat = PhysicsMaterial.new()
	mat.bounce = 0.9
	mat.friction = 0.0
	physics_material_override = mat

func _physics_process(_dt: float) -> void:
	# Tiny random nudge to prevent stalling
	apply_impulse(Vector3.ZERO, Vector3(
		randf_range(-0.01, 0.01),
		randf_range(-0.01, 0.01),
		randf_range(-0.01, 0.01)
	))
