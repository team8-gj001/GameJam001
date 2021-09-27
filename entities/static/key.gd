extends Node

onready var global_script = get_node("/root/global")
onready var sprite = get_node("Sprite")
onready var coll = get_node("CollisionShape2D")

func _ready():
	$Sprite.visible = true
	set_physics_process( true )

func _on_Area2D_area_entered(body):
	print("test")
	if body != null:
		if body.name == "Player":
			get_node("/root/global").key_get()
			set_physics_process( false )
			$Sprite.visible = false
			return
