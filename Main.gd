extends Spatial

func _ready():
	$Suelo/MeshInstance/StaticBody.connect("input_event", self, "_on_suelo_click")

func _physics_process(delta):
	var space_state = get_world().direct_space_state
	
func _on_suelo_click(camera: Node, event: InputEvent, click_position, click_normal, shape_idx):
	if event.is_action_pressed("click_sec"):
		$Player.destino = click_position
