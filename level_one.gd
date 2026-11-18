extends CharacterBody2D
@export var JumpForce := 4
@export var Gravity := 2

var jumpBuffer := 0.0
var coyoteTime := 0.0

func _physics_process(delta: float):
	jumpBuffer -= 1 + delta
	coyoteTime -= 1 + delta
	if is_on_floor():
		coyoteTime = 10
	else:
		velocity.y += Gravity * delta
	if Input.is_action_just_pressed("Jump"):
		jumpBuffer = 10
	if coyoteTime > 0 and jumpBuffer > 0:
		velocity.y = -JumpForce
		jumpBuffer = 0
		coyoteTime = 0
	
