extends "../state.gd"

export var MOVE_SPEED : int = 200
var moving_right : bool = true

func enter():
	if Input.is_action_pressed(input_dict["move_right"]):
		moving_right = true
	else:
		moving_right = false
	owner.dash(moving_right)
	change_animation()

func exit():
	owner.vel.x = 0
	print("exiting run/walk")
	owner.stop_sfx()
	
func handle_input(event: InputEvent):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "moving_jump")
	
	elif event.is_action_released(input_dict["move_right"]) and moving_right:
		emit_signal("finished", "idle")
		
	elif event.is_action_released(input_dict["move_left"]) and not moving_right:
		emit_signal("finished", "idle")
	
	elif event.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
		
	elif event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jab")
		
	elif event.is_action_pressed(input_dict["kick"]):
		emit_signal("finished", "kick")
		
	elif event.is_action_pressed(input_dict["slash"]):
		if owner.check_complex_buffer(["crouch", "move_right", "stand"]):
			owner.stop_sfx()
			emit_signal("finished", "hadouken")

		else:
			emit_signal("finished", "slash")
		
func update(_delta: float):
	var mod = -1
	if moving_right:
		mod = 1
	owner.vel.x = mod * MOVE_SPEED
	
func push(_vel):
	pass
	
func receive_hit(height: String):
	if height == "low":
		emit_signal("finished", "hitstun")
		return
	if moving_right and not owner.facing_right:
		emit_signal("finished", "block")
	elif owner.facing_right and not moving_right:
		emit_signal("finished", "block")
	else:
		emit_signal("finished", "hitstun")
		
func _on_audio_finished():
	owner.run()
