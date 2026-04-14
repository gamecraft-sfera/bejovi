extends Node3D


func _on_telefon_button_pressed() -> void:
	%TelefonButton.visible = false
	%TelefonCanvas/Telefon.visible = true
	%TelefonCanvas/AnimationPlayer.play("telefon")
	%TelefonCanvas.zobrazeno = true
