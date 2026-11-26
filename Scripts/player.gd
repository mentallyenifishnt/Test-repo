extends CharacterBody2D

@export var JumpForce: float
@export var JumpForceMultiplier: float
@export var GravityScale: float
@export var JumpCutForce: float
@export var PlayerSpot: Node2D
var currentHealth: int 
@export var MaxHealth: int = 3
func _ready():
	currentHealth = MaxHealth

func TakeDamage(Damage):
	currentHealth -=Damage
	print(currentHealth)
	if currentHealth == 0:
		die()
	
func die():
	get_tree().reload_current_scene()

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
		
