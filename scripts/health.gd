extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10.0
var health: float

func _ready():
	health = MAX_HEALTH

func take_damage(damage: float) -> Dictionary:
	health -= damage
	
	var health_state: Dictionary = { "Dead" : false, "Health": health }
	
	if health <= 0:
		const SMOKE_SCENE = preload("res://assets/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		smoke.global_position = get_parent().global_position
		get_parent().get_parent().add_child(smoke)
		get_parent().queue_free()
		
		health_state.Dead = true
		health_state.make_read_only()
		return health_state
		
	health_state.make_read_only()
	return health_state
