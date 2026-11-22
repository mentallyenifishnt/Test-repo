extends CharacterBody2D

@export var JumpForce: float
@export var JumpForceMultiplier: float
@export var GravityScale: float
@export var JumpCutForce: float
	
func _physics_process(delta: float) -> void:
	var trueJumpForce = JumpForce * JumpForceMultiplier
	if not is_on_floor():
		velocity += get_gravity() * GravityScale * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -trueJumpForce
		print("Jumped")
		
	if velocity.y < 0 and Input.is_action_pressed("Jump") == false:
		velocity.y /= JumpCutForce
		
	move_and_slide()
