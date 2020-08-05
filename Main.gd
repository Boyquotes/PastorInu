extends Spatial

export(float) var gravedad = -9.8

func _ready():
	$Suelo/MeshInstance/StaticBody.connect("input_event", self, "_on_suelo_click")

func _physics_process(delta):
	$Player.velocidad.y += gravedad*delta
	for oveja in $Ovejas.get_children():
		oveja.velocidad.y += gravedad
	
func _on_suelo_click(camera: Node, event: InputEvent, click_position, click_normal, shape_idx):
	if event.is_action_pressed("click_sec"):
		$Player.destino = click_position
