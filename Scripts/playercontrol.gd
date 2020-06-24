extends Node2D

var screensize
var shiploc
var velocity = Vector2()
var shot = preload("res://Scenes/shot.tscn")
var shotperiod = 0

func _ready():
	screensize = get_viewport_rect().size
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)


func _process(delta):

	velocity = Vector2()
		#ship movement
	if Input.is_action_pressed("ship_down"):
		velocity.y += 1
	#	shiploc.y += shipspeed * delta
	if Input.is_action_pressed("ship_up"):
		velocity.y -= 1
	#	shiploc.y -= shipspeed * delta
	if Input.is_action_pressed("ship_right"):
		velocity.x += 1
	#	shiploc.x += shipspeed * delta
	if Input.is_action_pressed("ship_left"):
		velocity.x -= 1
	#	shiploc.x -= shipspeed * delta
	if velocity.length() > 0:
		velocity = velocity.normalized() * global.playerShipSpeed

	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

	#spawn bullets
	if Input.is_action_pressed("ship_shoot") && shotperiod <= 0: #shotperiod sets up shot delay
		shiploc = get_node(".").get_position()
		var shotinstance = shot.instance()
		var newpos = shiploc + Vector2(50, 0) #offset the spawn location of shots to in front of ship
		shotinstance.set_position(newpos)
		get_node("../").add_child(shotinstance)
		shotperiod = global.playerShotInterval

	if shotperiod > 0:  #shot delay stuff
		shotperiod -= 1



func _on_Player_body_entered( body ):
	if(body.is_in_group("hazards")):
		if Input.is_action_pressed("ship_shield") && global.playerShipShield > 0:
			global.playerShipShield -= 1
		else:
			queue_free()
			#$CollisionShape2D.disabled = true
	if(body.is_in_group("powerup")):
		body.queue_free()
		global.playerShotDamage = 2

