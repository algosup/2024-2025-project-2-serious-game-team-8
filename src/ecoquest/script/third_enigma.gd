extends Node2D

var code= ""

func _ready() -> void:
	$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = get_parent().get_child(0).get_node("TimerControl").get_node("TimerBg").get_node("TimerText").modulate

	
func _on_return_button_pressed() -> void:
	queue_free()
	
func _on_button_pressed(number: int) -> void:
	if(code.length() < 4):
		code= code+ str(number)
	if(code.length()==4):
		if(code=="4132"):
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0,0.988,0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1,1,1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0,0.988,0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1,1,1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			add_child(Global.win_page.instantiate())
			Global.beat_chapter1 = true
			
		else:
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1,0,0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0.988,1,1)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(0.988,0,0)
			await get_tree().create_timer(0.15).timeout  # Wait for the duration
			$CanvasLayer/DigicodeControl/DigicodeFeedback.self_modulate = Color(1,1,1)

			code=""
