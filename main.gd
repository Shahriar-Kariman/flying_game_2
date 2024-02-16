extends Node3D

var obsticleNode = preload("res://obsticle.tscn")
var instance

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_obsticle()

func generate_obsticle():
	instance = obsticleNode.instantiate()
	var circleRadius = 10
	var p = randf_range(-PI,PI)
	instance.position = Vector3(circleRadius*cos(p),15,circleRadius*sin(p))
	instance.look_at_from_position(instance.position,Vector3(0,15,0),Vector3.UP)
	var randAngle = randf_range(-PI/2,PI/2)
	instance.rotate_object_local(Vector3.RIGHT,randAngle)
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
