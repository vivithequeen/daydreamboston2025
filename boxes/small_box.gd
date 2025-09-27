extends RigidBody2D

var base_weight := 1;
var current_weight : int;
var is_box = true;
var canfloat = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_weight = base_weight;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$StaticBody2D.global_position = self.global_position + Vector2(0,-32.250)
	$StaticBody2D.global_rotation = 0;

func _on_weightadder_area_entered(area:Area2D) -> void:
	if(area.name != "strengthchecker" and area.get_parent().get("is_box")):
		current_weight+=area.get_parent().base_weight;

func _on_weightadder_area_exited(area:Area2D) -> void:
	if(area.get_parent().get("is_box")):
		current_weight-=area.get_parent().base_weight;




func _on_strengthchecker_body_entered(body: Node2D) -> void:
	if(body.get("is_player")):
		if(body.max_push_weight >= current_weight):
			set_collision_layer_value(1 , false)
			set_collision_mask_value(1 , true)
		else:
			set_collision_layer_value(1 , true)

			set_collision_mask_value(1 , false)


func _on_strengthchecker_body_exited(body: Node2D) -> void:
	if(body.get("is_player")):
		set_collision_layer_value(1 , true)

		set_collision_mask_value(1 , false)
