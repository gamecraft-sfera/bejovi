extends CanvasLayer

var zobrazeno: bool = false

func _input(_event: InputEvent) -> void:
	if zobrazeno and Input.is_action_just_pressed("ui_cancel"):
		%TelefonCanvas/Telefon.visible = false
		%TelefonButton.visible = true

func _on_whatsapp_button_pressed() -> void:
	%SmSText.visible = true
