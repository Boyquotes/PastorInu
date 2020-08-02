extends Camera

export(float) var zoom_step = 1

func _physics_process(delta):
	if Input.is_action_pressed("zoom_in"):
		translate_object_local(Vector3.FORWARD * zoom_step)
	if Input.is_action_pressed("zoom_out"):
		translate_object_local(Vector3.BACK * zoom_step)
