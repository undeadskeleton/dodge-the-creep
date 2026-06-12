extends Sprite2D

@export var parent : Virtual_Joystick

@export var maxLength : int =60
@export var deadZone : int = 10
var pressing : bool
var timePressed : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxLength *= parent.scale.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle= parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x + cos(angle)*maxLength
			global_position.y = parent.global_position.y + sin(angle)* maxLength
		calculateVector()
	else:
		global_position = lerp(global_position,parent.global_position,delta*50)
		parent.posVector = Vector2(0,0)
	print(parent.posVector)

func calculateVector()-> void:
	if abs((global_position.x-parent.global_position.x)) >= deadZone:
		parent.posVector.x = (global_position.x - parent.global_position.x)/maxLength
	if abs((global_position.y - parent.global_position.y)) >= deadZone:
		parent.posVector.y = (global_position.y - parent.global_position.y)/maxLength
	pass



func _on_button_button_down() -> void:
	pressing = true


func _on_button_button_up() -> void:
	pressing = false
