extends Node2D

export(NodePath) var mira_path

onready var mira = get_node(mira_path)
onready var raio = $Visualizador/CollisionShape2D.shape.radius
var bala_path = preload("res://Bala.tscn")

func _physics_process(delta):
	var mousepos = get_global_mouse_position()
	var angulo = mousepos.angle_to_point(global_position)
	
	$Sprite.look_at(mousepos)
	
	if global_position.distance_to(mousepos) <= raio:
		mira.seguir = false
		mira.global_position = to_global(polar2cartesian(raio, angulo))
	
	else:
		mira.seguir = true
	
	if Input.is_action_just_pressed("click"):
		var newbala = bala_path.instance()
		newbala.direcao = global_position.direction_to(mira.global_position)
		newbala.global_position = $Sprite/Ponta.global_position
		get_parent().add_child(newbala)
