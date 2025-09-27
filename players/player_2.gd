extends CharacterBody2D

var is_player = true;


var current_weight := 2;

var canfloat : bool = false
var max_push_weight := 1;


func _physics_process(delta: float) -> void:
	
	current_weight = (2 if Global_sac.p2.has(0) else 0)
	canfloat = !Global_sac.p2.has(0)
	$ControllerHandlerComp.numArms = ((1 if Global_sac.p2.has(2) else 0) + (1 if Global_sac.p2.has(3) else 0))
	max_push_weight = $ControllerHandlerComp.numArms
	#print(current_weight)
	$ControllerHandlerComp.numLegs = ((1 if Global_sac.p2.has(4) else 0) + (1 if Global_sac.p2.has(5) else 0))

