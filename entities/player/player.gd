extends KinematicBody2D

var movespeed : int = 250 #250 pixels per press, i think
var score = 0 #score = time? 

var velocity : Vector2 = Vector2() #movement
var facingDir : Vector2 = Vector2() #this is so that the character will continue facing in that direction where you left them */
var vel : Vector2 = Vector2() #character directions


onready var rayCast = get_node("RayCast2d")

func _physics_process(delta):
	
	vel = Vector2()
	
	#key presses
	if Input.is_action_pressed("move_up"):
		vel.y -= 1
		facingDir = Vector2(0, -1)
	if Input.is_action_pressed("move_down"):
		vel.y += 1
		facingDir = Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		vel.x -= 1
		facingDir = Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		vel.x += 1
		facingDir = Vector2(1,0)
		
	vel = vel.normalized() #this is so that if the character goes diagonally *ex upper right, they won't speed up like bunny hopping
	
	move_and_slide(vel*movespeed) 
	 
