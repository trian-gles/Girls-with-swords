extends "state.gd"

func enter():
	owner.vel.x = 0
	change_animation()
	
	if Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
	
	elif Input.is_action_pressed(input_dict["move_right"]):
		emit_signal("finished", "walk")
	
	elif Input.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "walk")
		
	elif Input.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "jump")
	
func handle_input(event: InputEvent):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "jump")
	
	elif event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jab")
		
	elif event.is_action_pressed(input_dict["kick"]):
		emit_signal("finished", "kick")
		
	elif event.is_action_pressed(input_dict["slash"]):
		emit_signal("finished", "slash")	
			
	elif event.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
		
	elif event.is_action_pressed(input_dict["move_right"]):
		emit_signal("finished", "walk")
	
	elif event.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "walk")
		
	
func update(_delta: float):
	owner.vel.x = 0
