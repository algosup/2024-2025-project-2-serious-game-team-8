extends Node2D

@export var image_resource: Texture


func _ready() -> void:
	# Set the initial image on the specified node
	var chapter_two_image = $CanvasLayer/ChapterTwoImgControl/ChapterTwoImage
	chapter_two_image.texture = load("res://resources/chapterImages/chapter2img.png")
	_change_image_resource()
	Global.opened_hint_1_tutorial = false
	Global.opened_hint_2_tutorial = false

func _process(_delta: float) -> void:
	pass

func _on_setting_button_pressed() -> void:
	add_child(Global.settings.instantiate())

func _change_image_resource() -> void: 
	if Global.beat_chapter1 == true: 
		# Update the texture of the node when the condition is met
		var new_image_chapter_two_texture = load("res://resources/chapterImages/chapter2unlocked.png")
		var image_node = $CanvasLayer/ChapterTwoImgControl/ChapterTwoImage
		image_node.texture = new_image_chapter_two_texture

func _on_chapter_one_button_pressed() -> void:
	Global.current_chapter = 0
	get_tree().change_scene_to_packed(Global.tutorial)


func _on_chapter_two_button_pressed() -> void:
	if Global.beat_chapter1 == false: 
		var locked_instance = Global.chapter_locked.instantiate()
		add_child(locked_instance)
	elif Global.beat_chapter1 == true:
		var popup = Global.popup_page.instantiate()
		popup.text= "You've beaten the game for now. \nOur team is working on a new chapter. \nstay tuned and come back later"
		popup.color= Color(1,1,1)
		add_child(popup)


func _on_chapter_three_button_pressed() -> void:
	if Global.beat_chapter2 == false:
		var locked_instance = Global.chapter_locked.instantiate()
		add_child(locked_instance)
	elif Global.beat_chapter2 == true: 
		var popup = Global.popup_page.instantiate()
		popup.text= "You've beaten the game for now. \nOur team is working on a new chapter. \nstay tuned and come back later"
		popup.color= Color(1,1,1)
		add_child(popup)


func _on_close_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/home_page.tscn")
