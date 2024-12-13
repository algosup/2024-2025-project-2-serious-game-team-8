extends Node2D

# This script manages the logic for displaying and interacting with hints on the hint page.

# An integer representing the index of the desired hint to be displayed
@export var hint_index = 0

# Array holding all hints. Each inner array represents a chapter, and nested arrays contain the hint sequences.
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

# Called when the scene is ready
func _ready() -> void:
	# Reset global hint states for the tutorial
	Global.opened_hint_1_tutorial = false
	Global.opened_hint_2_tutorial = false
	Global.opened_hint_3_tutorial = false
	Global.opened_hint_4_tutorial = false
	Global.opened_hint_5_tutorial = false
	
	# Set the initial button states and colors based on global variables
	$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color if Global.opened_hint_1_tutorial else Global.initial_hint_button_color
	$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color if Global.opened_hint_2_tutorial else Global.initial_hint_button_color

	# Adjust the button visibility and positions based on the number of hints for the current chapter and index
	match len(hints[Global.current_chapter][hint_index]):
		1:
			# Display only the first button centered
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-63, 187)
			$CanvasLayer/ContainerControl/HintButton2.visible = false
			$CanvasLayer/ContainerControl/HintButton3.visible = false
			$CanvasLayer/ContainerControl/HintButton4.visible = false
			$CanvasLayer/ContainerControl/HintButton5.visible = false
		2:
			# Display the first two buttons and adjust positions
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-150, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(50, 187)
			$CanvasLayer/ContainerControl/HintButton3.visible = false
			$CanvasLayer/ContainerControl/HintButton4.visible = false
			$CanvasLayer/ContainerControl/HintButton5.visible = false
		3:
			# Display the first three buttons and adjust positions
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			$CanvasLayer/ContainerControl/HintButton3.visible = true
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-267, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(-63, 187)
			$CanvasLayer/ContainerControl/HintButton4.visible = false
			$CanvasLayer/ContainerControl/HintButton5.visible = false
		4:
			# Display the first four buttons and adjust positions
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			$CanvasLayer/ContainerControl/HintButton3.visible = true
			$CanvasLayer/ContainerControl/HintButton4.visible = true
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-267, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(-63, 187)
			$CanvasLayer/ContainerControl/HintButton5.visible = false
		5:
			# Display all five buttons
			$CanvasLayer/ContainerControl/HintButton2.visible = true
			$CanvasLayer/ContainerControl/HintButton3.visible = true
			$CanvasLayer/ContainerControl/HintButton4.visible = true
			$CanvasLayer/ContainerControl/HintButton5.visible = true
			$CanvasLayer/ContainerControl/HintButton1.position = Vector2(-267, 187)
			$CanvasLayer/ContainerControl/HintButton2.position = Vector2(-63, 187)

# Preload textures for button states
var normal = preload("res://resources/svg/Button/Square/Fill/Default.svg")
var focused = preload("res://resources/svg/Button/Square/Hover.png")

# Called when Hint Button 1 is pressed
func _on_hint_button_1_pressed() -> void:
	# Display the first hint and focus the button
	$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][0]
	$CanvasLayer/ContainerControl/HintButton1.texture_normal = focused
	$CanvasLayer/ContainerControl/HintButton2.texture_normal = normal
	$CanvasLayer/ContainerControl/HintButton3.texture_normal = normal
	$CanvasLayer/ContainerControl/HintButton4.texture_normal = normal
	$CanvasLayer/ContainerControl/HintButton5.texture_normal = normal

	# Update the state of the next button if it has not been opened
	if not Global.opened_hint_1_tutorial:
		Global.opened_hint_1_tutorial = true
		$CanvasLayer/ContainerControl/HintButton2.modulate = Global.final_hint_button_color

# Similarly, each button press updates the state and displays the corresponding hint
# The following functions handle logic for buttons 2-5

func _on_hint_button_2_pressed() -> void:
	if Global.opened_hint_1_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][1]
		$CanvasLayer/ContainerControl/HintButton2.texture_normal = focused
		# Enable the next hint button
		if not Global.opened_hint_2_tutorial:
			Global.opened_hint_2_tutorial = true
			$CanvasLayer/ContainerControl/HintButton3.modulate = Global.final_hint_button_color

func _on_hint_button_3_pressed() -> void:
	if Global.opened_hint_2_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][2]
		$CanvasLayer/ContainerControl/HintButton3.texture_normal = focused
		if not Global.opened_hint_3_tutorial:
			Global.opened_hint_3_tutorial = true
			$CanvasLayer/ContainerControl/HintButton4.modulate = Global.final_hint_button_color

func _on_hint_button_4_pressed() -> void:
	if Global.opened_hint_3_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][3]
		$CanvasLayer/ContainerControl/HintButton4.texture_normal = focused
		if not Global.opened_hint_4_tutorial:
			Global.opened_hint_4_tutorial = true
			$CanvasLayer/ContainerControl/HintButton5.modulate = Global.final_hint_button_color

func _on_hint_button_5_pressed() -> void:
	if Global.opened_hint_4_tutorial:
		$CanvasLayer/ContainerControl/HintBackground/Label.text = hints[Global.current_chapter][hint_index][4]
		$CanvasLayer/ContainerControl/HintButton5.texture_normal = focused
		if not Global.opened_hint_5_tutorial:
			Global.opened_hint_5_tutorial = true

# Close the hint popup
func _on_close_button_pressed() -> void:
	queue_free()  # Remove the current node from the scene tree
