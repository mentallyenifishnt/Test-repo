extends CharacterBody2D
class_name Platform

@export var MoveSpeed: float
@export var Size: float 

func _ready() -> void:
	$Sprite2D.scale.x = Size 
	$CollisionShape2D.scale.x = Size

func _physics_process(delta: float) -> void:
	position.x -= MoveSpeed
	pass

func _on_timer_timeout() -> void:
	queue_free()
