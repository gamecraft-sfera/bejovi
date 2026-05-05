extends Area3D

@export var color: Door.KEY_COLOR = Door.KEY_COLOR.NONE

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		if color == Door.KEY_COLOR.RED:
			Keys.red = true
			get_parent().queue_free()
		if color == Door.KEY_COLOR.GREEN:
			Keys.green = true
			get_parent().queue_free()
