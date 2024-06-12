extends Node2D

@export var MAX_SPAWN_TIME: float = 2

func spawn_mob() -> void:
	var new_mob = preload("res://scenes/mob.tscn").instantiate()	
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout() -> void:
	spawn_mob()
	%SpawnTimer.wait_time = randf_range(0.5, 2)
