extends "jab.gd"

# needs better hitbox and timing


func enter():
	owner.whiff()
	owner.get_node("AnimatedSprite").play("Slash")
