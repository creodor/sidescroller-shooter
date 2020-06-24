extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var roid = preload("res://Scenes/asteroid.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	get_node("SCROLL").position.x -= 0.35

	find_node("DebugInfo").text = ("Weapon Power: " + str(global.playerShotDamage) + "	SCROLL Pos:" + str(get_node("SCROLL").position.x) + "\nShield Str: " + str(global.playerShipShield) + "\nHazard Count: " + str(get_tree().get_nodes_in_group("hazards").size()) + "\nShot Count: " + str(get_tree().get_nodes_in_group("bullet").size()))
	
	if (int(get_node("SCROLL").position.x) % 100 == 0):
		spawn_hazard()
	
func spawn_hazard():
	if (get_tree().get_nodes_in_group("hazards").size() < 100):
		var hazardinstance = roid.instance()
		randomize()
		var randposy = rand_range(0, get_viewport().size.y) 
		var randposx = rand_range((((get_viewport().size.x + 100) - get_node("SCROLL").position.x) - 75), (((get_viewport().size.x + 100) - get_node("SCROLL").position.x) + 100))
		var newpos = Vector2(randposx, randposy)
		hazardinstance.set_position(newpos)
		get_node("SCROLL").add_child(hazardinstance)
