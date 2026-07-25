extends Node2D

class_name VirJoystick
var posVector : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DisplayServer.is_touchscreen_available():
		visible = true
	else:
		visible = false
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
