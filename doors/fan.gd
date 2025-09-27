extends StaticBody2D

var current_objects = []
var active : bool = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func activate():
	active = true;
func deactivate():
	active = false;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(active):
		for i in current_objects:
			if(i is CharacterBody2D):
				print(i)
				i.get_node("ControllerHandlerComp").up()
			elif(i is RigidBody2D):
				print("meow")
				i.apply_force(Vector2.UP * 150000000 * delta)


func _on_fan_area_body_entered(body:Node2D) -> void:

	print(body)
	if(body.get("current_weight") and body.get("current_weight") >= 1):
		print("pee pee poo poo")
		current_objects.append(body)




func _on_fan_area_body_exited(body:Node2D) -> void:
	if(body.get("current_weight") and body.get("current_weight") >= 1):

		for i in range(current_objects.size()):
			if(current_objects[i].name == body.name):
				current_objects.remove_at(i)
				break;
