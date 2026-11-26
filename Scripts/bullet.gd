extends Area2D

@export var speed = 400
@export var direction = Vector2.LEFT
@export var damage = 10 

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	print(body.name)
	if body.name == "Player":
		queue_free()

	

func _physics_process(delta):
	position += direction * speed * delta
	
func _ready():
	body_entered.connect(_on_body_entered)
