extends CharacterBody2D

var is_player = true;


var current_weight := 2;


var max_push_weight = 1;

func _physics_process(delta: float) -> void:
	current_weight = (0.5 if Global_sac.p1[0] != 0 else 0) + (0.5 if Global_sac.p1[1] != 0 else 0) + (0.5 if Global_sac.p1[2] != 0 else 0) + (0.5 if Global_sac.p1[3] != 0 else 0) + (0.5 if Global_sac.p1[4] != 0 else 0) + (0.5 if Global_sac.p1[5] != 0 else 0)
	$BodyHandlerComp.numArms = ((1 if Global_sac.p1.has(2) else 0) + (1 if Global_sac.p1.has(3) else 0))
	max_push_weight = $BodyHandlerComp.numArms
