extends Node
class_name BodyHandlerComp

@export var armL: CharacterBody2D
@export var armR: CharacterBody2D
@export var handler: ControllerHandlerComp

var rot_angle_deg = 85

func _physics_process(delta: float) -> void:
	if handler.get_movement().x < 0:
		armL.rotation_degrees = rot_angle_deg
		armR.rotation_degrees = rot_angle_deg
	elif handler.get_movement().x > 0:
		armL.rotation_degrees = -rot_angle_deg
		armR.rotation_degrees = -rot_angle_deg
	else:
		armL.rotation_degrees = 0
		armR.rotation_degrees = 0
