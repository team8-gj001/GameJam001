extends StaticBody2D

var velocity := Vector2.ZERO

onready var rcTop = get_node("RayCastTop")
onready var rcMid = get_node("RayCastMid")
onready var rcBot = get_node("RayCastBot")
onready var sprite = get_node("Sprite")
onready var coll = get_node("CollisionShape2D")
onready var pathFollow = get_parent()

onready var path = pathFollow.get_parent()
export var speed = 200  # speed in pixels/sec

var traverseTime = 5 # Time it takes to traverse the path
var t = 0 # Active time along the apth
var pathLength = 0 # Length of the path

func _ready():
	print(path)
	pathLength = path.get_curve().get_baked_length()

func _process(_delta):
	if (t > traverseTime):
		t = 0
	t += _delta
	print(t)
	pathFollow.set_offset((t/traverseTime) * pathLength)

func _physics_process(_delta):
	if rcTop.is_colliding() or rcMid.is_colliding() or rcBot.is_colliding():
		if rcTop.get_collider().name == "Player" or rcMid.get_collider().name == "Player" or rcBot.get_collider().name == "Player":
				get_node("/root/global").kill_player()
