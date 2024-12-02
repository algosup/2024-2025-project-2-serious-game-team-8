extends Node2D

## An int representing the type of digicode, 0 being hints & 1 being puzzles
@export var hints_or_puzzles: int = 0

var hint_codes = [["1234"], ["4321", "3456"]]
var puzzle_codes = [["1435"], ["2345", "2443"]]


func _on_digicode_press(buttonID: int):
	var label = $CanvasLayer/DisplayControl/Label
	var original_color = label.get_theme_color("font_color","Label")
	var red = Color(1,0,0)
	if hints_or_puzzles != (1 | 0):
		hints_or_puzzles = 0
	if str(label.text).length() < 4:
		match buttonID:
			0:
				label.text += "0"
			1:
				label.text += "1"
			2:
				label.text += "2"
			3:
				label.text += "3"
			4:
				label.text += "4"
			5:
				label.text += "5"
			6:
				label.text += "6"
			7:
				label.text += "7"
			8:
				label.text += "8"
			9:
				label.text += "9"
	if buttonID == 10:
		if hints_or_puzzles == 0:
			if hint_codes[Global.current_chapter].has(label.text):
				print("present")
				label.text = ""

			else:
				for i in range(2):
						label.add_theme_color_override("font_color", red)  # Change to red
						await get_tree().create_timer(0.3).timeout  # Wait for the duration
						label.add_theme_color_override("font_color", original_color)  # Revert to original color
						await get_tree().create_timer(0.3).timeout  # Wait again for the duration

		elif puzzle_codes[Global.current_chapter].has(label.text):
			var code_page = Global.code_page.instantiate()
			get_parent().add_child(code_page)
			queue_free()
			
		else:
			print("fail")
	if buttonID == 11:
		label.text = label.text.substr(0, label.text.length() - 1)


func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())


func _on_close_button_pressed() -> void:
	queue_free()
