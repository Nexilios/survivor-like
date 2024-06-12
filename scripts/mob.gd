extends CharacterBody2D

@export var health_component: HealthComponent
@onready var player = $/root/Game/Player

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
	
func take_damage():
	%Slime.play_hurt()
	
	if health_component:
		health_component.take_damage(1.0)
