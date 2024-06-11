extends CharacterBody2D

@onready var player = $/root/Game/Player

func _physics_process(delta):
	var direction: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
