extends "Player.gd"

func _init():
	input_dict = {
		"jump" : "p1_jump",
		"move_right" : "p1_move_right",
		"move_left" : "p1_move_left",
		"crouch" : "p1_crouch",
		"punch" : "p1_punch",
		"slash" : "p1_slash",
		"kick" : "p1_kick"
	}


func _on_Area2D_body_entered(body):
	if body.name == "P2":
		inside_hurtbox = true
	

func _on_Area2D_body_exited(body):
	if body.name == "P2":
		inside_hurtbox = false

func hit_connect(dmg: int, stun: int, push: Vector2):
	get_parent().hit_player("P2", dmg, stun, push)
	
func sub_hadouken():
	var mask = 24
	hadouken(24)


