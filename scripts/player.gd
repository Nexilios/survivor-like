class_name SurvivorsPlayer

extends CharacterBody2D

@export var health_component: HealthComponent

func _physics_process(delta):
	const speed: float = 600.0
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed;
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()


