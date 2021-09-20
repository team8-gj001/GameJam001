extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://version.txt", File.READ)
	var ver = file.get_as_text()
	file.close()
	find_node("Version").set_text(ver)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_PlayButton_pressed():
	get_node("/root/global").enter_level("res://scenes/tutorial/tut.tscn")
