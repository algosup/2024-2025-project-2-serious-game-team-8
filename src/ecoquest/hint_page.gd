extends Node2D

# Holds every hints, each array representing a chapter
var hints =[["test1", "test2", "test3"], ["test4", "test5", "test6"], ["test7", "test8", "test9"]]
func _ready() -> void:
	# Set button states and colors based on the global variables
	$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color if Global.opened_hint_1_tutorial else Global.initial_hint_button_color
	$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color if Global.opened_hint_2_tutorial else Global.initial_hint_button_color



var normal = preload("res://resources/svg/Button/Square/Fill/Default.svg")
var focused = preload("res://resources/svg/Hover.png")
func _on_hint_button_1_pressed() -> void:
	# Always allow the hint popup to appear
	$CanvasLayer/ContainerControl/HintBackground/Label.text= hints[Global.current_chapter][0]
	$CanvasLayer/ContainerControl/HintButton1.texture_normal= focused
	$CanvasLayer/ContainerControl/HintButton2.texture_normal= normal
	$CanvasLayer/ContainerControl/HintButton3.texture_normal= normal
	# Update state and make Button 2 active
	if not Global.opened_hint_1_tutorial:
		Global.opened_hint_1_tutorial = true
		$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color  # Update Button 2 color

func _on_hint_button_2_pressed() -> void:
		if Global.opened_hint_1_tutorial:
			$CanvasLayer/ContainerControl/HintBackground/Label.text= hints[Global.current_chapter][1]
			$CanvasLayer/ContainerControl/HintButton1.texture_normal= normal
			$CanvasLayer/ContainerControl/HintButton2.texture_normal= focused
			$CanvasLayer/ContainerControl/HintButton3.texture_normal= normal
			# Update state and make Button 3 active
			if not Global.opened_hint_2_tutorial:
				Global.opened_hint_2_tutorial = true
				$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color  # Update Button 3 color

func _on_hint_button_3_pressed() -> void:
		if Global.opened_hint_2_tutorial:
			$CanvasLayer/ContainerControl/HintBackground/Label.text= hints[Global.current_chapter][2]
			$CanvasLayer/ContainerControl/HintButton1.texture_normal= normal
			$CanvasLayer/ContainerControl/HintButton2.texture_normal= normal
			$CanvasLayer/ContainerControl/HintButton3.texture_normal= focused
		
		
		# Mark the third hint as opened
		if not Global.opened_hint_3_tutorial:
			Global.opened_hint_3_tutorial = true

func _on_close_button_pressed() -> void:
	queue_free()  # Close the current scene or dialog
