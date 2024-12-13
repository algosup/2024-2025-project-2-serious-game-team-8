extends Node2D

## This script is directly linked to the chapter selection page, it serves to navigate in the app
## basic checking for chapters locking/unlocking and chapter initialization/selection.

@export var image_resource: Texture # exporting Backgroudn texture to change it dynamically


func _ready() -> void:
	get_parent().get_node("TransitionLayer") # initializing transition

	# Set the initial image on the specified node
	var chapter_two_image = $CanvasLayer/ChapterTwoImgControl/ChapterTwoImage
	chapter_two_image.texture = load("res://resources/chapterImages/chapter2img.png")
	_change_image_resource()
	Global.opened_hint_1_tutorial = false
	Global.opened_hint_2_tutorial = false


func _on_setting_button_pressed() -> void:
	# Transitions before moving to the setting page
	get_parent().get_node("TransitionLayer").visible = true
	await get_parent().get_node("TransitionLayer")._transition()
	get_parent().add_child(Global.settings.instantiate())

func _change_image_resource() -> void: 
	if Global.beat_chapter1 == true: 
		# Update the texture of the chapter image if it has been unlocked
		var new_image_chapter_two_texture = load("res://resources/chapterImages/chapter2unlocked.png")
		var image_node = $CanvasLayer/ChapterTwoImgControl/ChapterTwoImage
		image_node.texture = new_image_chapter_two_texture

# Tutorial image button
func _on_chapter_one_button_pressed() -> void:
	# Launch tutorial
	Global.current_chapter = 0 # set the current chapter index to 0, tells the state machine which codes, hints and timer to use
	add_child(Global.confirmation_tutorial.instantiate())

# chapter one image button
func _on_chapter_two_button_pressed() -> void:
	# Launch chapter one
	Global.current_chapter = 1 # set the current chapter index to 1, tells the state machine which codes, hints and timer to use
	
	# This checks whether the chapter is locked or not, and adds a pop-up accordingly
	if Global.beat_chapter1 == false: 
		var locked_instance = Global.chapter_locked.instantiate()
		add_child(locked_instance)
	elif Global.beat_chapter1 == true:
		# Sends to the confirmation pop-up to start the level
		add_child(Global.confirmation_chapter1.instantiate())


# chapter two image button
func _on_chapter_three_button_pressed() -> void:
	# This checks whether the chapter is locked or not, and adds a pop-up accordingly
	if Global.beat_chapter2 == false:
		var locked_instance = Global.chapter_locked.instantiate()
		add_child(locked_instance)
	elif Global.beat_chapter2 == true: 
		# Temporary pop-up showing as the story isn't yet available, this will change when chatper 2 is added.
		var popup = Global.popup_page.instantiate()
		popup.text= "You've beaten the game for now. \nOur team is working on a new chapter. \nstay tuned and come back later"
		popup.color= Color(1,1,1)
		add_child(popup)

# This function runs whenever the the close button is pressed
func _on_close_button_pressed() -> void:
	# calls the transition first
	get_parent().get_node("TransitionLayer").visible = true
	await get_parent().get_node("TransitionLayer")._transition()
	# Then cleans it up
	queue_free()

# This functions calls the transition whenever the node exits the tree, this fixes some issues with the transition
func _on_tree_exiting() -> void:
	await get_parent().get_node("TransitionLayer")._fade_in()
