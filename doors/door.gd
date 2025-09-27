extends StaticBody2D

var activated : bool = false;
var startPos : Vector2;
var endPos : Vector2;

func _ready():
	startPos = global_position;
	endPos = global_position - Vector2(0,-256)
func activate():
	if(!activated):
		activated =true 
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position:y",endPos.y,0.25);

func deactivate():
	if(activated):
		activated =false 
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position:y",startPos.y,0.25);
