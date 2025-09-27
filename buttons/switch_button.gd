extends Node2D

@export var flip : bool = false

@export var activate_objects : Array[Node2D];

var near_players = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.flip_h = flip;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.visible = !near_players.is_empty()


func _on_player_check_body_entered(body:Node2D) -> void:
	if(body.get("is_player")):
		near_players.append(body)


func _on_player_check_body_exited(body:Node2D) -> void:
	if(body.get("is_player")):
		for i in range(near_players.size()):
			if(near_players[i].name == body.name):
				near_players.remove_at(i)
				break;


func activate():
	print("meow")
	for i in activate_objects:
		i.activate()