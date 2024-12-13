extends Node2D

## This popup appears when tutorial is succesful by the user, this gives story 
## elements and guides the player in discarding cards and keeping other cards
## It's working in two parts, first the lore part, await for user to click, 
## then guides the player.

# stores the number of time the user clicked on screen
var click: int = 1

func _input(event: InputEvent) -> void:
	# check if the screen has been pressed by the user
	if event is InputEventMouseButton and event.is_pressed():
		if click == 1:
			# Play with scene visibility, hides the story whenever the screen is
			# pressed to show the congratulation page
			$CanvasLayer/StoryPage/StoryControl.visible = false
			$CanvasLayer/Congratulations/CongratulationsControl.visible = true
			click += 1  # Increment click to change the state
		elif click == 2:
			queue_free()  # Free the current scene
			# redirect back the user to the home page, do not change this as this
			# would break the menu music
			get_tree().change_scene_to_file("res://scene/home_page.tscn")
