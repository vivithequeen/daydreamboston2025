extends Node

var levels = ["levels/level_1.tscn", "levels/level_2.tscn","levels/level_3.tscn","levels/level_4.tscn","levels/level_5.tscn", "levels/end"]
var currentLevel = 1;
var p1 = [0, 1, 2, 3, 4, 5]
var p2 = [-1, -1, -1, -1, -1, -1]


func reset():
	p1 = [0, 1, 2, 3, 4, 5]
	p2 = [-1, -1, -1, -1, -1, -1]
#Make a Global
#weiht height arm 1 arm 2 leg 1 leg 2

func load_next_level():
	get_tree().change_scene_to_file(levels[currentLevel - 1])

func end_level():
	reset()
	currentLevel += 1;
	get_tree().change_scene_to_file("res://levels/prelevel.tscn")

func restart_level():
	get_tree().change_scene_to_file("res://levels/prelevel.tscn")
