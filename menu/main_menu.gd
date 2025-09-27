extends Control

func _on_start_pressed() -> void:
	$VBoxContainer.hide()
	$Start.show()

func _on_real_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/prelevel.tscn")

func _on_to_menu_from_start_pressed() -> void:
	$Start.hide()
	$VBoxContainer.show()



func _on_credits_pressed() -> void:
	$VBoxContainer.hide()
	$Credits.show()

func _on_to_menu_from_credits_pressed() -> void:
	$Credits.hide()
	$VBoxContainer.show()



func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$VBoxContainer/Exit.disabled = false
	else:
		$VBoxContainer/Exit.disabled = true
