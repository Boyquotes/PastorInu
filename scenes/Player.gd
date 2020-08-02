extends KinematicBody

export(int) var speed := 30
export(int) var accel := 100

onready var velocidad := Vector3.ZERO
onready var direccion := Vector3.RIGHT setget set_direccion
onready var destino := translation setget set_destino


func _physics_process(delta):
	self.direccion = translation.direction_to(destino)
	velocidad = velocidad.move_toward(direccion*speed, accel)
	velocidad = move_and_slide(velocidad, Vector3.UP)
	

func set_destino(val: Vector3):
	destino = val

func set_direccion(val: Vector3):
	direccion = val.normalized()
