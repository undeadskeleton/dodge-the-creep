extends Sprite2D

@export var parent : Virtual_Joystick

@export var maxLength : int =60
@export var deadZone : int = 10
var pressing : bool
var timePressed : int = 1 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressing:
		print("Button is pressed",timePressed)
		timePressed+=1


func _on_button_button_down() -> void:
	pressing = true


func _on_button_button_up() -> void:
	pressing = false
