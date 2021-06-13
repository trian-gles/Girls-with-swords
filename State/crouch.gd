extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Crouch")
	owner.crouch()

func handle_input(event):
	if not Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "idle")
	
	elif event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "crouch_jab")
		
	elif event.is_action_pressed(input_dict["kick"]):
		emit_signal("finished", "sweep")
	
	elif event.is_action_pressed(input_dict["slash"]):
		if len(owner.input_buf) > 3:
			var dir: String = "move_right"
			if not owner.facing_right: dir = "move_left"
			if (owner.input_buf[1] == dir) and (owner.input_buf[2] == "crouch") and (owner.input_buf[3] == dir):
				emit_signal("finished", "DP")
				return
		
		emit_signal("finished", "crouch_slash")

func receive_hit():
	if Input.is_action_pressed(input_dict["move_left"]) and owner.facing_right:
		emit_signal("finished", "crouch_block")
	elif Input.is_action_pressed(input_dict["move_right"]) and not owner.facing_right:
		emit_signal("finished", "crouch_block")
	else:
		emit_signal("finished", "hitstun")
