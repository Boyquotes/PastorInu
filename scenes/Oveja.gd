extends KinematicBody

enum {
	PASTAR, HUIR, MOVER
}

export(int) var speed := 15
export(int) var accel := 50
export(float) var limite_exterior = 5.0
export(float) var limite_interior = 1.0

var velocidad := Vector3.ZERO
var direccion := Vector3.RIGHT setget set_direccion


func _physics_process(delta):
	# Detectar ovejas
	for obeja in $DetectorOvejas.get_overlapping_bodies():
		if translation.distance_to(obeja.translation) > limite_exterior:
			velocidad = velocidad.move_toward(translation.direction_to(obeja.translation)*speed, accel)
		elif translation.distance_to(obeja.translation) < limite_interior:
			velocidad = velocidad.move_toward(obeja.translation.direction_to(translation)*speed, accel)
	
	# Detectar perro
	for perro in $DetectorPerro.get_overlapping_bodies():
		velocidad = velocidad.move_toward(perro.translation.direction_to(translation)*speed, accel)
	
	velocidad = move_and_slide(velocidad, Vector3.UP)

func set_direccion(val: Vector3):
	direccion = val.normalized()

