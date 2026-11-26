extends CharacterBody2D

@export var JumpForce: float
@export var JumpForceMultiplier: float
@export var GravityScale: float
@export var GlideGravityScale: float
@export var GlideMaxVelocity: float
@export var MaxGlideStamina: float
@export var StaminaDrainRate: float
var currentStamina: float
var IsGliding: bool

@export var JumpCutForce: float
@export var PlayerSpot: Node2D
var currentHealth: int 
@export var MaxHealth: int = 3
func _ready():
	currentHealth = MaxHealth
	currentStamina = MaxGlideStamina

func TakeDamage(Damage):
	currentHealth -=Damage
	if currentHealth == 0:
		die()
	
func die():
	get_tree().reload_current_scene()

func _process(delta: float) -> void:
	if Input.is_action_pressed("Glide") and velocity.y > 0:
		IsGliding = true
		currentStamina -= StaminaDrainRate * delta 
	if not Input.is_action_pressed("Glide") or currentStamina <= 0:
		IsGliding = false

func _physics_process(delta: float) -> void:
	move_and_slide()
	var trueJumpForce = JumpForce * JumpForceMultiplier
	global_position.x = PlayerSpot.global_position.x
	if not is_on_floor():
		if IsGliding:
			if velocity.y > GlideMaxVelocity:
				velocity.y = GlideMaxVelocity
			else:
				velocity += get_gravity() * GravityScale * delta
		else:
			velocity += get_gravity() * GravityScale * delta
	else:
		currentStamina = MaxGlideStamina
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -trueJumpForce
		
	if velocity.y < 0 and Input.is_action_pressed("Jump") == false:
		velocity.y /= JumpCutForce
	print(currentStamina)
