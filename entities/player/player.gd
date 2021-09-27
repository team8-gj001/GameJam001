extends KinematicBody2D

var score := 0 #score = time? 

var velocity := Vector2.ZERO

onready var rayCast = get_node("RayCast2D")
onready var sprite = get_node("Sprite")
onready var coll = get_node("CollisionShape2D")

export var speed = 200  # speed in pixels/sec

func get_input():
	velocity = Vector2.ZERO # reset velocity every tick
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster

	velocity = velocity.normalized() * speed
	sprite.rotation = velocity.angle()
	coll.rotation = velocity.angle()
	

func _physics_process(_delta):
	get_input() # seperate this into its own function
	var movement = move_and_slide(velocity)
