extends Node3D

@export var min_speed: float = 0.5
@export var max_speed: float = 8.0

@export var x_limit: float = 12.0   # left/right boundaries
@export var y_limit: float = 8.0    # top/bottom boundaries
@export var z_limit: float = 20.0   # forward/back boundaries

@export var min_spin: float = 0.0
@export var max_spin: float = 2.0

@export var wall_bounce_randomness: float = 0.7
@export var midair_random_chance: float = 0.002

var velocity: Vector3
var angular_velocity: Vector3

func _ready():
	randomize()
	_randomize_velocity()
	_randomize_spin()

func _process(delta: float) -> void:
	# Move position
	translate(velocity * delta)

	# Spin
	rotate_object_local(Vector3.RIGHT, angular_velocity.x * delta)
	rotate_object_local(Vector3.UP, angular_velocity.y * delta)
	rotate_object_local(Vector3.FORWARD, angular_velocity.z * delta)

	var pos = global_transform.origin
	var bounced := false

	# Bounce + clamp using sign() instead of copysign()
	if abs(pos.x) > x_limit:
		velocity.x = -velocity.x * randf_range(1.0 - wall_bounce_randomness, 1.0 + wall_bounce_randomness)
		global_transform.origin.x = sign(pos.x) * x_limit
		bounced = true
	if abs(pos.y) > y_limit:
		velocity.y = -velocity.y * randf_range(1.0 - wall_bounce_randomness, 1.0 + wall_bounce_randomness)
		global_transform.origin.y = sign(pos.y) * y_limit
		bounced = true
	if abs(pos.z) > z_limit:
		velocity.z = -velocity.z * randf_range(1.0 - wall_bounce_randomness, 1.0 + wall_bounce_randomness)
		global_transform.origin.z = sign(pos.z) * z_limit
		bounced = true

	# On bounce, tweak spin and occasionally velocity
	if bounced:
		_randomize_spin()
		if randf() < 0.3:
			_randomize_velocity()

	# Rare mid-air random tweak
	if randf() < midair_random_chance:
		if randf() < 0.5:
			_randomize_velocity()
		else:
			_randomize_spin()

func _randomize_velocity():
	var dir = Vector3(
		randf_range(-1, 1),
		randf_range(-1, 1),
		randf_range(-1, 1)
	).normalized()
	var speed = randf_range(min_speed, max_speed)
	velocity = dir * speed

func _randomize_spin():
	angular_velocity = Vector3(
		randf_range(min_spin, max_spin),
		randf_range(min_spin, max_spin),
		randf_range(min_spin, max_spin)
	) * (1 if randf() > 0.5 else -1)
