extends CharacterBody2D
@export var BulletVelocity: float
func _process(delta: float) -> void:
	position.x -= BulletVelocity 
func _physics_process(delta: float) -> void:
	move_and_slide()
	
func _on_timer_timeout():
	queue_free()
