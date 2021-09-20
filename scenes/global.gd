extends Node

var current_scene = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)

func enter_level(path):
	call_deferred("_d_enter_level", path) # deferred means to wait till no code is running
	
func _d_enter_level(path):
	current_scene.free() # nuke current scene :(
		
	var new_scene = load(path).instance()
	var hud = load("res://scenes/hud.tscn").instance()
	new_scene.add_child(hud)
	current_scene = new_scene
	
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene) # make compatiable with godot API
