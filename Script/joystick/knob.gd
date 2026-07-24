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
			var angle= parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x + cos(angle)* maxLength
			global_position.y = parent.global_position.y + sin(angle) * maxLength
		calculateVector()
	else:
		global_position = lerp(global_position,parent.global_position,delta*50)
		parent.posVector = Vector2(0,0)
		%Debugger.text= "False"

func _on_button_button_down() -> void:
	pressing = true


func _on_button_button_up() -> void:
	pressing = false
	
func calculateVector()-> void:
	if abs(global_position.x-parent.global_position.x)>= deadZone:
		parent.posVector.x = (global_position.x-parent.global_position.x)/ maxLength
		%Debugger2.text = "global_position.x("+str(snapped((global_position.x),0.001))+")-parent.global_position.x("+str(parent.global_position.x)+") /maxLength("+str(maxLength)+") = "+str((global_position.x-parent.global_position.x)/maxLength)
	if abs(global_position.y-parent.global_position.y) >= deadZone:
		parent.posVector.y = (global_position.y-parent.global_position.y) / maxLength
		%Debugger2.text = "global_position.x("+str(snapped((global_position.x),0.001))+")-parent.global_position.x("+str(parent.global_position.x)+") /maxLength("+str(maxLength)+") = "+str((global_position.x-parent.global_position.x)/maxLength)
