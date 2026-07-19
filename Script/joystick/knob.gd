extends Sprite2D

var pressing : bool
@export var parent : VirJoystick
var maxLength : int = 100
var deadZone : int = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		%Debugger.text = "True"
		if parent.global_position.distance_to(get_global_mouse_position()) <= maxLength:
			global_position= get_global_mouse_position()
		else:
			var angle= get_global_mouse_position().angle_to(parent.global_position)
			global_position.x = cos(angle)* maxLength
			global_position.y = sin(angle) * maxLength

	else:
		global_position = lerp(global_position,parent.global_position,delta*50)
		%Debugger.text= "False"

func _on_button_button_down() -> void:
	pressing = true


func _on_button_button_up() -> void:
	pressing = false
