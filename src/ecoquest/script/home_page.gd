extends Node2D

func _ready() -> void:
	fade_in_music()


func _on_texture_button_pressed() -> void:
	add_child(Global.chapter_selection.instantiate())
	


func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())

func fade_in_music():
	var tween = create_tween()
	tween.tween_property($MenuMusic, "volume_db", 0, 3.0)  
	$MenuMusic.play()
