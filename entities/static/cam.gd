extends StaticBody2D

onready var rcTop = get_node("RayCastTop")
onready var rcMid = get_node("RayCastMid")
onready var rcBot = get_node("RayCastBot")
onready var sprite = get_node("Sprite")
onready var coll = get_node("CollisionShape2D")

func _physics_process(_delta):
	if rcTop.is_colliding() and rcTop.get_collider() != null:
		if rcTop.get_collider().name == "Player":
			get_node("/root/global").kill_player()
	if rcMid.is_colliding() and rcMid.get_collider() != null:
		if rcMid.get_collider().name == "Player":
			get_node("/root/global").kill_player()
	if rcBot.is_colliding() and rcBot.get_collider() != null:
		if rcBot.get_collider().name == "Player":
			get_node("/root/global").kill_player()
