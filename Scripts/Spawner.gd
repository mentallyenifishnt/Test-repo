extends Node2D
@export var MaxPosition: float 
@export var MinPosition: float
@export var Player: Node2D
@export var MoveTime: float
var _moveTimer: float

@export var SpawnScene: PackedScene
@export var MinPlatformLength: float
@export var MaxPlatformLength: float

func _ready() -> void:
	_movePosition()
func _process(delta: float) -> void:
	if _moveTimer > 0:
		_moveTimer -= delta
	else:
		_movePosition()
	
	
func _movePosition():
	var PlayerPosition = Player.global_position.y
	var object = SpawnScene.instantiate()
	#sets the object spawn position to the spawners current position
	object.global_position = global_position
	#checking if the object being spawned is a platform
	if object is Platform:
		object.Size = randf_range(MinPlatformLength, MaxPlatformLength)
	#spawns object
	get_tree().current_scene.add_child.call_deferred(object)
	position.y = randf_range(PlayerPosition + MinPosition, PlayerPosition - MaxPosition)
	_moveTimer = MoveTime
