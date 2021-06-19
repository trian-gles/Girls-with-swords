extends "hit_state.gd"

func enter():
	.enter()
	owner.block()

func receive_hit(height):
	if height == "low":
		emit_signal("finished", "hitstun")
	else:
		print("Blockstring")
		owner.block()
	
func update(_delta):
	owner.vel.x = 0
	
func _on_animation_finished():
	emit_signal("finished", "idle")
