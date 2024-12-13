extends Node2D

## This script manages the splash screen, animating the logo, waiting for a loading period, and transitioning to the home page.

# Declare a variable to store the Tween instance
var tween: Tween

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Create a tween instance to handle the animation
	tween = create_tween()
	
	# Animate the scale of the logo over 1.5 seconds with an ease-out effect
	tween.tween_property(
		$CanvasLayer/LogoControl/Logo,      # The target node (Logo)
		"scale",                            # The property to animate (scale)
		Vector2(0.35, 0.35),                # The target scale value
		1.5                                 # Duration of the animation in seconds
	).set_ease(Tween.EASE_OUT)             # Set the easing to 'ease out' (slower towards the end)

	# Connect the tween's 'finished' signal to a custom function
	tween.finished.connect(_on_tween_finished)

# Called when the tween animation finishes
func _on_tween_finished() -> void:
	# Start the loading timer after the animation completes
	$LoadingTime.start()

# Preload the home page scene to prepare it for transitioning
var home: PackedScene = preload("res://scene/home_page.tscn")

# Called when the loading timer times out
func _on_loading_time_timeout() -> void:
	# Make the transition layer visible for the transition effect
	$TransitionLayer.visible = true

	# Wait for the transition effect to complete before changing the scene
	await $TransitionLayer._transition()

	# Attempt to change the current scene to the home page
	var result = get_tree().change_scene_to_packed(home)
	if result != OK:
		# Print an error message if the scene change fails
		print("Failed to change scene: ", result)
