extends KinematicBody2D

var movespeed := 250 #250 pixels per press, i think
var score := 0 #score = time? 

var velocity := Vector2.ZERO
var facingDir := Vector2() #this is so that the character will continue facing in that direction where you left them */
var vel := Vector2() #character directions


onready var rayCast = get_node("RayCast2D")

export var speed = 200  # speed in pixels/sec

func get_input(delta):
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

func _physics_process(delta):
	get_input(delta) # seperate this into its own function
	var movement = move_and_slide(velocity)
	print(movement)
