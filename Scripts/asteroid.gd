extends KinematicBody2D

var maxHealth = 4
var health = maxHealth
var powup = preload("res://Scenes/Powerup1.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("HPBar").max_value = maxHealth
	set_process(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#pass
	
func _physics_process(delta):
	#var screensize = get_viewport_rect().size
	
	if get_global_position().x < -50.0:
		queue_free()

func hit_by_bullet(dam):
	health -= dam
	get_node("HPBar").show()
	get_node("HPBar").value = health
	if health <= 0:
		queue_free()
