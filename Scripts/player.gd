extends CharacterBody2D

@export var JumpVelocity: float
@export var GravityScale: float
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * GravityScale * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -JumpVelocity
		print("Jumped")
		
	move_and_slide()
