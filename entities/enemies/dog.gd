extends StaticBody2D

onready var sprite = get_node("Sprite")
onready var coll = get_node("CollisionShape2D")
onready var pathFollow = get_parent()

onready var path = pathFollow.get_parent()

export var traverseTime = 5 # Time it takes to traverse the path
var t = 0 # Active time along the apth
var pathLength = 0 # Length of the path

func _ready():
	if not path is Path2D:
		return
	pathLength = path.get_curve().get_baked_length()

func _process(_delta):
	if not path is Path2D:
		return
	if (t > traverseTime):
		t = 0
	t += _delta
	pathFollow.set_offset((t/traverseTime) * pathLength)

func _on_Area2D_body_entered(body):
	if body != null:
		if body.name == "Player":
			get_node("/root/global").kill_player()
