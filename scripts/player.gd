extends CharacterBody2D

@export var health_component: HealthComponent
@export var damage_rate: float

signal health_depleted

func _ready() -> void:
	if health_component:
		%ProgressBar.max_value = health_component.MAX_HEALTH

func _physics_process(delta):
	const speed: float = 600.0
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed;
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		if health_component:
			var health_state: Dictionary = health_component.take_damage(damage_rate * overlapping_mobs.size() * delta)
			%ProgressBar.value = health_state.get("Health")
			if health_state.get("Dead"):
				health_depleted.emit()
