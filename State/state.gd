extends Node

signal finished(next_state_name)

var input_dict = null

func map_inputs(mapping: Dictionary):
	input_dict = mapping
	
func change_animation():
	owner.change_animation(name)

func enter():
	pass
	
func exit():
	pass
	
func handle_input(_event: InputEvent):
	pass
	
func push(x_vel : int):
	owner.vel.x = x_vel / 2

func update(_delta: float):
	pass
	
func _on_animation_finished():
	return
	
func _on_audio_finished():
	print("Audio finished")

func receive_hit(height: String):
	emit_signal("finished", "hitstun")
