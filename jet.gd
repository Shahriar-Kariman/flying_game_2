extends CharacterBody3D

var circleRadius : float
var circleSpeed : float
var circleAngle : float #radians
var selfRotationSpeed : float
var lastDirection : Vector3

var forward = 0
var roll = 0
var count = 2

func _ready():
	circleRadius = 10
	circleSpeed = .5
	circleAngle = 0
	selfRotationSpeed = -0.5

	lastDirection = Vector3(1, 0, 0)
	lastDirection.normalized()

func _physics_process(delta):
	
	
	if Input.is_action_pressed("forward"):
		forward = 1
	else:
		if count:
			forward = 1
			count -= 1
		else:
			forward = 0
	
	#handel_collision()
	
	if Input.is_action_pressed("roll_left"):
		roll = -1
	elif Input.is_action_pressed("roll_right"):
		roll = 1
	else:
		roll = 0
	
	circleAngle += circleSpeed * delta * forward
	
	circleAngle = fmod(circleAngle , 2*PI)
	
	var newPositionX = circleRadius * cos(circleAngle)
	var newPositionZ = circleRadius * sin(circleAngle)
	
	var newPosition = Vector3(newPositionX, position.y, newPositionZ)
	var newDirection = newPosition - position
	
	newDirection.normalized()
	
	if !test_move(transform,newDirection):
		var rotationAngle = -1*lastDirection.angle_to(newDirection)
		transform = transform.rotated(Vector3.UP, rotationAngle)
		position = newPosition
		lastDirection = newDirection
	
	#Rotation
	transform = transform.rotated_local(Vector3.FORWARD, selfRotationSpeed * delta * roll)
	
	move_and_slide()

func handel_collision():
	for index in range (get_slide_collision_count()):
		print("collision")
		var collision = get_slide_collision(index)
		if collision.get_collider() == null:
			continue
		if collision.get_collider().is_in_group("frame"):
			continue
		elif collision.get_collider().is_in_group("center"):
			continue
		else:
			continue
		break # prevent further duplicate calls?
