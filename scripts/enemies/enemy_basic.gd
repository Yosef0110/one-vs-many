extends CharacterBody2D

@export var speed: float = 100.0
@export var max_health: int = 100

var health: int
var target: Node2D = null

func _ready():
	health = max_health
	target = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	if target == null:
		velocity = Vector2.ZERO
		return

	var direction = global_position.direction_to(target.global_position)
	velocity = direction * speed

	move_and_slide()

func take_damage(amount: int):
	health -= amount

	if health <= 0:
		die()

func die():
	queue_free()
