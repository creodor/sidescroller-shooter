extends KinematicBody2D

#export (int) var shotSpeed
#export (int) var shotDamage
var direction = Vector2(1.0, 0.0)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	#var shotpos = get_node(".").get_position()
	#shotpos += direction * shotspeed * delta
	#get_node(".").set_position(shotpos)
	pass
	
func _physics_process(delta):
	var screensize = get_viewport_rect().size
	var collision_info = move_and_collide(direction * global.playerShotSpeed * delta)
	if collision_info:
		if collision_info.collider.has_method("hit_by_bullet"):
			collision_info.collider.call("hit_by_bullet", global.playerShotDamage) #call hit_by_bullet method in collider
		queue_free() #destroy self on collision
	if get_position().x > (screensize.x + 100):
		queue_free()
