extends Node

var timer
onready var global_script = get_node("/root/global")

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
