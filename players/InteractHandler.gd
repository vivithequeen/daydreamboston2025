extends Node
class_name InteractHandlerComp

@export var detector: Area2D
@export var actor: CharacterBody2D

var interactable = null

func _ready() -> void:
	detector.area_entered.connect(found_interactable)
	detector.area_exited.connect(left_interactable)

func found_interactable(area: Area2D):
	if not area.get_parent() is CharacterBody2D:
		interactable = area.get_parent()

func left_interactable(area: Area2D):
	if area == interactable:
		interactable = null

func has_interactable() -> bool:
	return interactable == null

func use_interactable() -> void:
	if interactable != null and interactable.has_method("activate"):
		interactable.activate()
