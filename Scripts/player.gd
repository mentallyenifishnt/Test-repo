extends CharacterBody2D

@export var JumpForce: float
@export var JumpForceMultiplier: float
@export var GravityScale: float
@export var JumpCutForce: float
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	var trueJumpForce = JumpForce * JumpForceMultiplier
	if is_on_floor():
		var platform = get_last_slide_collision()
		if platform and platform.get_collider().is_in_group("Platform"):
			var platformSpeed = platform.get_collider().MoveSpeed
			position.x += platformSpeed
	else:
		velocity += get_gravity() * GravityScale * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -trueJumpForce
		
	if velocity.y < 0 and Input.is_action_pressed("Jump") == false:
		velocity.y /= JumpCutForce
		
