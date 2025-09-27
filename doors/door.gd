extends StaticBody2D

var activated : bool = false;
func activate():
	if(!activated):
		activated =true 
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position:y",position.y+256,0.5);

func deactivate():
	if(activated):
		activated =false 
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position:y",position.y-256,0.5);
