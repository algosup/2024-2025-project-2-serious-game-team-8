extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasLayer/Control/Logo,"scale", Vector2(1,1), 2)
	
