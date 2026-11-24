extends CharacterBody2D

@export var MoveSpeed: float

func _physics_process(delta: float) -> void:
	position.x -= MoveSpeed
	pass

func _on_timer_timeout() -> void:
	queue_free()
