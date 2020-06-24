extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	if (Input.is_action_pressed("pause") && self.visible == false):
		_on_pause_button_pressed()
		
	if (Input.is_action_pressed("pause") && self.visible == true):
		_on_pause_popup_close_pressed()

func _on_pause_button_pressed():
	get_tree().paused = true
	self.show()
	
func _on_pause_popup_close_pressed():
	self.hide()
	get_tree().paused = false
