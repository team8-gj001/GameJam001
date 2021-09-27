extends KinematicBody2D

var velocity := Vector2.ZERO
var facingDir := Vector2() #this is so that the character will continue facing in that direction where you left them */
var vel := Vector2() #character directions


onready var rayCast = get_node("RayCast2D")
onready var sprite = get_node("Sprite")
onready var coll = get_node("CollisionShape2D")

export var speed = 200  # speed in pixels/sec

func get_input():
	velocity = Vector2.ZERO # reset velocity every tick
	# Make sure diagonal movement isn't faster

	velocity = velocity.normalized() * speed
	sprite.rotation = velocity.angle()
	coll.rotation = velocity.angle()
	

func _physics_process(_delta):
	get_input() # seperate this into its own function
	if rayCast.is_colliding():
			print(rayCast.get_collider().name)
	var movement = move_and_slide(velocity)
