extends CanvasLayer

signal transitionned

func _ready() -> void:
	pass


func _transition():
	$AnimationPlayer.play("fade_to_black")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_to_black":
		$AnimationPlayer.play("fade_to_normal")
		emit_signal("transitionned")
