extends Sprite2D

@export var parent : Virtual_Joystick2

var pressing : bool
@export var maxLength : float = 50.0
@export var deadZone : float = 10.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= maxLength:
			global_position= get_global_mouse_position()
		else:
			var angle=parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x=parent.global_position.x+cos(angle)*maxLength
			global_position.y=parent.global_position.y+sin(angle)*maxLength
			print(global_position)
	else:
		global_position = lerp(global_position,parent.global_position,delta*50)



func _on_button_button_up() -> void:
	pressing = false


func _on_button_button_down() -> void:
	pressing = true
