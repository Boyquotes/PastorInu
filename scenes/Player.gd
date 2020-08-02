extends KinematicBody

export(int) var speed := 30
export(int) var accel := 100

var velocidad := Vector3.ZERO
var destino := Vector3.ZERO setget set_destino
var dir := Vector3.RIGHT setget set_direccion


func _physics_process(delta):
	self.dir = translation.direction_to(destino)
	velocidad = velocidad.move_toward(dir*speed, accel)
	velocidad = move_and_slide(velocidad)
	

func set_destino(val: Vector3):
	destino = val

func set_direccion(val: Vector3):
	dir = val.normalized()
