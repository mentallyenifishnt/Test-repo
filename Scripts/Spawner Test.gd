extends Node2D
@export var MaxPosition: float 
@export var MinPosition: float
@export var MoveTime: float
var _moveTimer: float

@export var BulletScene: PackedScene

func _ready() -> void:
	_movePosition()
func _process(delta: float) -> void:
	if _moveTimer > 0:
		_moveTimer -= delta
	else:
		_movePosition()
	print(_moveTimer)
	
	
func _movePosition():
	var bullet = BulletScene.instantiate()
	#sets the bullets spawn position to the shooters current position
	bullet.global_position = global_position
	#spawns bullet
	get_tree().current_scene.add_child(bullet)
	position.y = randf_range(MaxPosition, MinPosition)
	_moveTimer = MoveTime
