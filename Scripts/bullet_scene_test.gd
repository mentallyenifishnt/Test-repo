extends Node2D
@export var BulletVelocity: float
func _process(delta: float) -> void:
	position.x += BulletVelocity 
