extends KinematicBody2D

var direcao:Vector2
var velocidade = 500

func _physics_process(delta):
	move_and_slide(direcao*300)
	rotation = direcao.angle()
