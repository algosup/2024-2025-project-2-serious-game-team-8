extends Node2D

var click: int = 1

func _ready() -> void:
	$CanvasLayer/Congratulations/CongratulationsControl.visible = true
	$CanvasLayer/StoryPage/StoryControl.visible = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if click == 1:
			$CanvasLayer/StoryPage/StoryControl.visible = false
			$CanvasLayer/Congratulations/CongratulationsControl.visible = true
			click += 1  # Increment click properly
		elif click == 2:
			queue_free()  # Free the current scene
			get_tree().change_scene_to_file("res://scene/home_page.tscn")
