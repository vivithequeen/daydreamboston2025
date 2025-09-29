extends TextureButton

var offset = 350
var y_pos = [50, 130, 210, 290, 370, 450]
var index = 0
var temp = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	index = int(get_child(0).name)
	position.x = 300
	position.y = y_pos[index]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	position.x += offset
	offset *= -1
	
	if index in Global_sac.p1:
		print("1")
		for i in range(6):
			print(Global_sac.p2[i])
			if Global_sac.p2[i] == -1:
				for j in range(6):
					if Global_sac.p1[j] == index:
						Global_sac.p1[j] = -1
						Global_sac.p2[i] = index
						position.y = y_pos[i]
						print("changed1")
						break
				break
	
	elif index in Global_sac.p2:
		print("2")
		for i in range(6):
			print(Global_sac.p1[i])
			if Global_sac.p1[i] == -1:
				for j in range(6):
					if Global_sac.p2[j] == index:
						Global_sac.p2[j] = -1
						Global_sac.p1[i] = index
						position.y = y_pos[i]
						print("changed2")
						break
				break
	
	
	print("\n")
	for i in range(6):
		print("p1 upg " + str(i) + ": " + str(Global_sac.p1[i]))
	print("\n")
	for j in range(6):
		print("p2 upg " + str(j) + ": " + str(Global_sac.p2[j]))

func _on_mouse_entered() -> void:
	scale *= 1.2
	modulate.a8 = 200
	$"Label".visible = true

func _on_mouse_exited() -> void:
	scale /= 1.2
	modulate.a8 = 255
	$"Label".visible = false
