extends Node2D

var screen = preload("res://upgrades/Upgrade_Screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.z_index += 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get("is_player"):
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
		make_scene(self, screen)

func make_scene(parent, scene):
	var instance = scene.instantiate()

	#insert other actions to fit your needs here
  
	parent.add_child(instance)
