extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer
onready var global_script = get_node("/root/global")
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = self.get_node("TimerLabel")

func _process(delta):
	var time_text = ""
	var run_time = global_script.run_time
	var seconds = fmod(run_time, 60.0)
	run_time /= 60
	var minutes = fmod(run_time, 60.0)
	if minutes >= 1:
		time_text = str(floor(minutes)) + ":"
	time_text = time_text + str(stepify(seconds, 0.01))
	timer.set_text(time_text)
	global_script.run_time += delta
