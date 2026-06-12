extends CharacterBody2D

@export var speed :int = 400
@export var joystick : Virtual_Joystick
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size=get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var direction = joystick.posVector
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2(0,0)

	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
