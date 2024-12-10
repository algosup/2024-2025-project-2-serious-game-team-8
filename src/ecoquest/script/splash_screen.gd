extends Node2D

var tween: Tween

func _ready() -> void:
	tween = create_tween()
	
	# Apply easing: `ease_out` makes the animation slower towards the end
	tween.tween_property(
		$CanvasLayer/LogoControl/Logo,      # The target node
		"scale",                        # The property to animate
		Vector2(0.35, 0.35),                  # The target value
		1.5                            # Duration of the animation
	).set_ease(Tween.EASE_OUT)
	tween.finished.connect(_on_tween_finished)

func _on_tween_finished() -> void:
	$LoadingTime.start()
	
var home:PackedScene = preload("res://scene/home_page.tscn")

func _on_loading_time_timeout() -> void:
	var result = get_tree().change_scene_to_packed(home)
	if result != OK:
		print("Failed to change scene: ", result)
