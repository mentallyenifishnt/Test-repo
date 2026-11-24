extends Node2D
@export var MaxPosition: float 
@export var MinPosition: float
@export var MoveTime: float
var _moveTimer: float

@export var SpawnScene: PackedScene

func _ready() -> void:
	_movePosition()
func _process(delta: float) -> void:
	if _moveTimer > 0:
		_moveTimer -= delta
	else:
		_movePosition()
	
	
func _movePosition():
	var bullet = SpawnScene.instantiate()
	#sets the bullets spawn position to the shooters current position
	bullet.global_position = global_position
	#spawns bullet
	get_tree().current_scene.add_child.call_deferred(bullet)
	position.y = randf_range(MaxPosition, MinPosition)
	_moveTimer = MoveTime
