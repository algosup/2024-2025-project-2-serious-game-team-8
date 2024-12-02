extends Node2D


func _ready() -> void:
	$CanvasLayer/TimerControl/TimerBg/TimerText.modulate = get_parent().get_child(0).get_node("TimerControl").get_node("TimerBg").get_node("TimerText").modulate


func _on_return_button_pressed() -> void:
	queue_free()

var input1 = "CanvasLayer/CodeControl/Input1/Label"
var input2 = "CanvasLayer/CodeControl/Input2/Label"
var input3 = "CanvasLayer/CodeControl/Input3/Label"
var input4 = "CanvasLayer/CodeControl/Input4/Label"

var codes=["3426","1443","1566"]

func _on_input_pressed(buttonID: int) -> void:
	match buttonID:
		1:
			if int(get_node(input1).text) < 9:
				get_node(input1).text = str(int(get_node(input1).text) + 1)
			else:
				get_node(input1).text = "0"
		2:
			if int(get_node(input1).text) > 0:
				get_node(input1).text = str(int(get_node(input1).text) - 1)
			else:
				get_node(input1).text = "9"
		3:
			if int(get_node(input2).text) < 9:
				get_node(input2).text = str(int(get_node(input2).text) + 1)
			else:
				get_node(input2).text = "0"
		4:
			if int(get_node(input2).text) > 0:
				get_node(input2).text = str(int(get_node(input2).text) - 1)
			else:
				get_node(input2).text = "9"
		5:
			if int(get_node(input3).text) < 9:
				get_node(input3).text = str(int(get_node(input3).text) + 1)
			else:
				get_node(input3).text = "0"
		6:
			if int(get_node(input3).text) > 0:
				get_node(input3).text = str(int(get_node(input3).text) - 1)
			else:
				get_node(input3).text = "9"
		7:
			if int(get_node(input4).text) < 9:
				get_node(input4).text = str(int(get_node(input4).text) + 1)
			else:
				get_node(input4).text = "0"
		8:
			if int(get_node(input4).text) > 0:
				get_node(input4).text = str(int(get_node(input4).text) - 1)
			else:
				get_node(input4).text = "9"


func _on_enter_button_pressed() -> void:
	var answer = get_node(input1).text + get_node(input2).text + get_node(input3).text + get_node(input4).text
	if str(answer) == codes[Global.current_chapter]:
		add_child(Global.win_page.instantiate())
		get_parent().is_chapter_finished = true
		Global.beat_chapter1 = true
	else:
		var popup = Global.popup_page.instantiate()
		popup.text= "There was an error. \nThis was the wrong password. \n-1 minute to the timer"
		popup.color= Color(1,0,0)
		add_child(popup)
		var time_left = get_parent().get_child(0).get_node("Timer").time_left
		get_parent().remove_time()
		if time_left <= 60:
			$CanvasLayer/TimerControl/TimerBg/TimerText.modulate =  Color(1, 0, 0)
		
