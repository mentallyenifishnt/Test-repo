extends CharacterBody2D

@export var JumpForce: float
@export var JumpForceMultiplier: float
@export var GravityScale: float
@export var JumpCutForce: float
@export var PlayerSpot: Node2D


func _physics_process(delta: float) -> void:
	move_and_slide()
	var trueJumpForce = JumpForce * JumpForceMultiplier
	global_position.x = PlayerSpot.global_position.x
	if not is_on_floor():
		velocity += get_gravity() * GravityScale * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -trueJumpForce
		
	if velocity.y < 0 and Input.is_action_pressed("Jump") == false:
		velocity.y /= JumpCutForce
		
