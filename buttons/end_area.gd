extends Node2D



var current_objects = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body:Node2D) -> void:
	if(body.get("is_player")):
		current_objects.append(body)
		if(current_objects.size() == 2):
			Global_sac.end_level()




func _on_area_2d_body_exited(body:Node2D) -> void:
	if(body.get("is_player")):
		for i in range(current_objects.size()):
			if(current_objects[i].name == body.name):
				current_objects.remove_at(i)
				break;