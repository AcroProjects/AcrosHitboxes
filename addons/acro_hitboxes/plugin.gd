tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("Hitbox", "Area2D", preload("hitbox.gd"), preload("icon.svg"))
	pass


func _exit_tree():
	remove_custom_type("Hitbox")
	pass
