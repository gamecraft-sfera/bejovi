class_name Door extends Node3D

enum KEY_COLOR {NONE, RED, GREEN}

@export var key_color: KEY_COLOR = KEY_COLOR.NONE

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and have_proper_key():
		$AnimationPlayer.play("open")


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") and have_proper_key():
		$AnimationPlayer.play_backwards("open")

func have_proper_key() -> bool:
	match key_color:
		KEY_COLOR.NONE:
			return true
		KEY_COLOR.RED:
			return Keys.red
		KEY_COLOR.GREEN:
			return Keys.green
			
	return false
