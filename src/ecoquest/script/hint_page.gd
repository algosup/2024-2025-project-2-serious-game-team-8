extends Node2D

## An int representing the index of the desired hints
@export var hint_index = 0

# Holds every hints, each array representing a chapter
var hints = [
	[["Focus only on the important words of the topic.", "Read attentively the text.", "There are 5 numbers to consider."]],
	[
		[
			"You probably need some ingredients.",
			"6 formulas should help you.",
			"Try the formulas on the machine using the ingredients.",
			"Only 3 are ecological.",
			"If you made an ecological household product, a number should have appeared."
		],
		["This board is really dirty.", "Try to clean it with some product."],
		["One of these household products could be useful.", "Which product would clean the board?", "The spray is perfect for this dirty board."],
		["You probably missed some shadow"],
		["No way to open it, you should try to force it.", "A tool could be helpful.", "You probably missed some shadow."],
		["A tool to force some locks."],
		["Wait for the card 59 to be removed."]
	]
]


func _ready() -> void:
	# Resets opened hints
	Global.opened_hint_1_tutorial=  false
	Global.opened_hint_2_tutorial=  false
	Global.opened_hint_3_tutorial=  false
	Global.opened_hint_4_tutorial=  false
	Global.opened_hint_5_tutorial=  false
	
	# Set button states and colors based on the global variables
	$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color if Global.opened_hint_1_tutorial else Global.initial_hint_button_color
	$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color if Global.opened_hint_2_tutorial else Global.initial_hint_button_color
	match len(hints[Global.current_chapter][hint_index]):
		1:
			# Place the hint button n°1 at the center
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-63, 187)

			# Turn every other button as invisble
			$CanvasLayer/ContainerControl/HintButton2.visible = false
			$CanvasLayer/ContainerControl/HintButton3.visible = false
			$CanvasLayer/ContainerControl/HintButton4.visible = false
			$CanvasLayer/ContainerControl/HintButton5.visible = false
		2:
			# Turn hint button n°2 as visible
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			
			# Center button N°1 and button n°2
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-150, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(50, 187)

			# Turn every other button as invisble
			$CanvasLayer/ContainerControl/HintButton3.visible = false
			$CanvasLayer/ContainerControl/HintButton4.visible = false
			$CanvasLayer/ContainerControl/HintButton5.visible = false

		3:
			# Turn hint button n°2 and n°3 as visible
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			$CanvasLayer/ContainerControl/HintButton3.visible = true

			# Center button n°1 and n°2
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-267, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(-63, 187)

			# Turn every other button as invisble
			$CanvasLayer/ContainerControl/HintButton4.visible = false
			$CanvasLayer/ContainerControl/HintButton5.visible = false
		4:
			# Turn hint button n°2, n°3 and n°4 as visible
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			$CanvasLayer/ContainerControl/HintButton3.visible = true
			$CanvasLayer/ContainerControl/HintButton4.visible = true

			# Center button n°1 and n°2
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-267, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(-63, 187)

			# Turn button n°5 as invisble
			$CanvasLayer/ContainerControl/HintButton5.visible = false
		5:
			# Turn every button as visible
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			$CanvasLayer/ContainerControl/HintButton3.visible = true
			$CanvasLayer/ContainerControl/HintButton4.visible = true
			$CanvasLayer/ContainerControl/HintButton5.visible = true

			# Center button N°1 and n°2
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-267, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(-63, 187)


var normal = preload("res://resources/svg/Button/Square/Fill/Default.svg")
var focused = preload("res://resources/svg/Button/Square/Hover.png")


func _on_hint_button_1_pressed() -> void:
	# Always allow the hint popup to appear
	$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][0]
	$CanvasLayer/ContainerControl/HintButton1.texture_normal = focused
	$CanvasLayer/ContainerControl/HintButton2.texture_normal = normal
	$CanvasLayer/ContainerControl/HintButton3.texture_normal = normal
	$CanvasLayer/ContainerControl/HintButton4.texture_normal = normal
	$CanvasLayer/ContainerControl/HintButton5.texture_normal = normal
	# Update state and make Button 2 active
	if not Global.opened_hint_1_tutorial:
		Global.opened_hint_1_tutorial = true
		$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color  # Update Button 2 color


func _on_hint_button_2_pressed() -> void:
	if Global.opened_hint_1_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][1]
		$CanvasLayer/ContainerControl/HintButton1.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton2.texture_normal = focused
		$CanvasLayer/ContainerControl/HintButton3.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton4.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton5.texture_normal = normal
		# Update state and make Button 3 active
		if not Global.opened_hint_2_tutorial:
			Global.opened_hint_2_tutorial = true
			$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color  # Update Button 3 color


func _on_hint_button_3_pressed() -> void:
	if Global.opened_hint_2_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][2]
		$CanvasLayer/ContainerControl/HintButton1.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton2.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton3.texture_normal = focused
		$CanvasLayer/ContainerControl/HintButton4.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton5.texture_normal = normal

		# Mark the third hint as opened
		if not Global.opened_hint_3_tutorial:
			Global.opened_hint_3_tutorial = true
			$CanvasLayer/ContainerControl/HintButton4.modulate = Global.final_hint_button_color  # Update Button 3 color
		

func _on_hint_button_4_pressed() -> void:
	if Global.opened_hint_3_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][3]
		$CanvasLayer/ContainerControl/HintButton1.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton2.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton3.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton4.texture_normal = focused
		$CanvasLayer/ContainerControl/HintButton5.texture_normal = normal

			# Mark the third hint as opened
		if not Global.opened_hint_4_tutorial:
			Global.opened_hint_4_tutorial = true
			$CanvasLayer/ContainerControl/HintButton5.modulate = Global.final_hint_button_color  # Update Button 3 color
		

func _on_hint_button_5_pressed() -> void:
	if Global.opened_hint_4_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][4]
		$CanvasLayer/ContainerControl/HintButton1.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton2.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton3.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton4.texture_normal = normal
		$CanvasLayer/ContainerControl/HintButton5.texture_normal = focused

			# Mark the third hint as opened
		if not Global.opened_hint_5_tutorial:
			Global.opened_hint_5_tutorial = true


func _on_close_button_pressed() -> void:
	queue_free()  # Close the current scene or dialog
