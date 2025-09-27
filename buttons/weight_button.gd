extends StaticBody2D

@export var activate_objects : Array[Node2D];
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body:Node2D) -> void:
	print(body)
	if(body.get("current_weight") and body.get("current_weight") >= 1):
		print("pee pee poo poo")
		for i in activate_objects:
			i.activate()


func _on_area_2d_body_exited(body:Node2D) -> void:
	if(body.get("current_weight") and body.get("current_weight") >= 1):
		print("pee pee poo poo")
		for i in activate_objects:
			i.deactivate()