extends Node2D

var background_list = [
	"res://resources/background/homebackground2.jpg",
	"res://resources/background/homebackground3.jpg",
	"res://resources/background/homebackground.jpg"
]

var current_background_index: int = 0

@onready var background: TextureRect = $CanvasLayer/BackgroundControl/TextureRect


func _ready() -> void:
	$TransitionLayer.visible = true
	await $TransitionLayer._fade_in()
	$TransitionLayer.visible = false
	$MenuMusic.play()
	$BackGroundChangeTimer.start()

func _on_setting_button_pressed() -> void:
	await _start_animation()
	add_child(Global.settings.instantiate())


func _on_back_ground_change_timer_timeout() -> void:
	# Create a tween for the fade transition
	var tween = create_tween()
	
	# Fade to black
	tween.tween_property(background, "modulate", Color(0, 0, 0, 1), 1.0)  # Fully black in 1 second
	
	# Add callback to change the background after fading to black
	tween.tween_callback(Callable(self, "_change_background"))
	
	# Fade back to normal
	tween.tween_property(background, "modulate", Color(1, 1, 1, 1), 1.0)

func _change_background() -> void:
	# Increment index and wrap around using modulo operator
	current_background_index = (current_background_index + 1) % background_list.size()
	# Update the texture
	background.texture = load(background_list[current_background_index])


func _on_start_button_pressed() -> void:
	await _start_animation()
	add_child(Global.chapter_selection.instantiate())

func _start_animation() -> void:
	$TransitionLayer.visible = true
	await $TransitionLayer._transition()
	
	
