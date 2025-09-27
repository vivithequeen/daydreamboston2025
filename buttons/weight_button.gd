extends StaticBody2D

@export var activate_objects : Array[Node2D];

@export var evil : bool = false
var current_objects = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#fix for mutipal players URGENT NEXT THING TO DO
func _on_area_2d_body_entered(body:Node2D) -> void:
	print(body)
	if(body.get("current_weight") and body.get("current_weight") >= 1):
		print("pee pee poo poo")
		current_objects.append(body)
		if(evil):
			for i in activate_objects:
				i.deactivate()
		else:
			for i in activate_objects:
				i.activate()


func _on_area_2d_body_exited(body:Node2D) -> void:
	if(body.get("current_weight") and body.get("current_weight") >= 1):

		for i in range(current_objects.size()):
			if(current_objects[i].name == body.name):
				current_objects.remove_at(i)
				break;
		if(current_objects.is_empty()):
			if(evil):
				for i in activate_objects:
					i.activate()
			else:
				for i in activate_objects:
					i.deactivate()
