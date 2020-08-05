extends Node

func mediana_geometrica(array, lower_limit=0.1):
	if array.size() <= 0:
		return
		
	if array.size() == 1:
		return array[0]
	

func punto_distancia_minima(array):
	if array.size() <= 0:
		return
		
	if array.size() == 1:
		return array[0]
	
	var sum := Vector3.ZERO
	for p in array:
		sum.x = sum.x + p.x
		sum.y = sum.y + p.y
		sum.z = sum.z + p.z
	
	var cosa = Vector3(
		sum.x/array.size(),
		sum.y/array.size(),
		sum.z/array.size()
	)

	return cosa
