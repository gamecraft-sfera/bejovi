extends Node3D


func _on_telefon_button_pressed() -> void:
	%TelefonButton.visible = false
	$CanvasLayer2/Telefon.visible = true
	$CanvasLayer2/AnimationPlayer.play("telefon")
