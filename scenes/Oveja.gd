extends KinematicBody

enum {
	PASTAR, HUIR, MOVER
}

export(int) var speed_max := 15
export(int) var speed_min := 5
export(int) var accel := 50
export(float) var distancia_minima_ovejas = 5.0
export(float) var distancia_maxima_ovejas = 10.0
export(float) var distancia_minima_perro = 10.0
export(float) var gravedad = -9.8

var velocidad := Vector3.ZERO
var direccion := Vector3.RIGHT setget set_direccion
var estado := MOVER
var cambiar_estado := false setget set_cambiar_estado, get_cambiar_estado

var flag_print = 3


func _ready():
	velocidad = Vector3(randf()*speed_max, 0, randf()*speed_max)
	estado = MOVER

func _physics_process(delta):
	match estado:
		PASTAR:
			velocidad = velocidad.move_toward(Vector3.ZERO, accel)
			# Cambiar de estado aleatoriamente
			
		HUIR:
			# Detectar perro
			for perro in $DetectorPerro.get_overlapping_bodies():
				velocidad = velocidad.move_toward(perro.translation.direction_to(translation)*speed_max, accel)
			# Iniciar animacion de correr
			
		MOVER:
			if $DetectorOvejas.get_overlapping_bodies().size() > 0:
				pass
			else:
				velocidad = velocidad.move_toward(Vector3.ZERO, accel)
			
			for oveja in $DetectorOvejas.get_overlapping_bodies():
				# Acercarse a obejas
				if translation.distance_to(oveja.translation) >= distancia_maxima_ovejas:
					velocidad = velocidad.move_toward(translation.direction_to(oveja.translation)*speed_min, accel)
				
				# Alejarse de ovejas
				if translation.distance_to(oveja.translation) <= distancia_minima_ovejas:
					velocidad = velocidad.move_toward(oveja.translation.direction_to(translation)*speed_min, accel)
			
			# Alejarse del perro
			for perro in $DetectorPerro.get_overlapping_bodies():
				if translation.distance_to(perro.translation) <= distancia_minima_perro:
					velocidad = velocidad.move_toward(perro.translation.direction_to(translation)*speed_min, accel)
	
	# Gravedad
	velocidad.y += gravedad
	
	velocidad = move_and_slide(velocidad, Vector3.UP)
	

func set_direccion(val: Vector3):
	direccion = val.normalized()

func set_cambiar_estado(val: bool):
	cambiar_estado = val

func get_cambiar_estado():
	return cambiar_estado
	
