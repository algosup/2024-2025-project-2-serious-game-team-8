extends Node2D

func _ready() -> void:
	# Set button states and colors based on the global variables
	$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color if Global.opened_hint_1_tutorial else Global.initial_hint_button_color
	$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color if Global.opened_hint_2_tutorial else Global.initial_hint_button_color

func _on_hint_button_1_pressed() -> void:
	# Always allow the hint popup to appear
	add_child(Global.hint_1_tutorial.instantiate())  # Show popup or hint
	
	# Update state and make Button 2 active
	if not Global.opened_hint_1_tutorial:
		Global.opened_hint_1_tutorial = true
		$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color  # Update Button 2 color

func _on_hint_button_2_pressed() -> void:
	if Global.opened_hint_1_tutorial:
		add_child(Global.hint_2_tutorial.instantiate())  # Show popup or hint
		
		# Update state and make Button 3 active
		if not Global.opened_hint_2_tutorial:
			Global.opened_hint_2_tutorial = true
			$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color  # Update Button 3 color

func _on_hint_button_3_pressed() -> void:
	if Global.opened_hint_2_tutorial:
		add_child(Global.hint_3_tutorial.instantiate())  # Show popup or hint
		
		# Mark the third hint as opened
		if not Global.opened_hint_3_tutorial:
			Global.opened_hint_3_tutorial = true

func _on_close_button_pressed() -> void:
	queue_free()  # Close the current scene or dialog
