extends Node3D

signal passed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_center_area_exited(area):
	$center.queue_free()
	passed.emit()
