extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Hitstun")
	

func receive_hit():
	print("COMBO")
	emit_signal("finished", "knockdown")

	
func _on_animation_finished():
	emit_signal("finished", "idle")