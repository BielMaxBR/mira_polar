extends Node2D

var seguir = true

func _physics_process(delta):
	if seguir:
		global_position = get_global_mouse_position()
