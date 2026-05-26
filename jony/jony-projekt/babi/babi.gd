extends Node2D
@onready var obr_1: Node2D = $Obr1
@onready var obr_2: Node2D = $Obr2
@onready var obr_3: Node2D = $Obr3
@onready var obr_4: Node2D = $Obr4
@onready var obr_5: Node2D = $Obr5
@onready var obr_6: Node2D = $Obr6
@onready var obr_7: Node2D = $Obr7
@onready var obr_8: Node2D = $Obr8
@onready var obr_9: Node2D = $Obr9

var _state: int = 1

func _ready() -> void:
	obr_1.visible = true
	obr_2.visible = false
	obr_3.visible = false
	obr_4.visible = false
	obr_5.visible = false
	obr_6.visible = false
	obr_7.visible = false
	obr_8.visible = false
	obr_9.visible = false
	
	
func _input(event: InputEvent) -> void:
	
	if event is InputEventKey and event.is_pressed():
		match _state:
			1:
				obr_1.visible = false
				obr_2.visible = true
			2:
				obr_2.visible = false
				obr_3.visible = true
			3:
				obr_3.visible = false
				obr_4.visible = true
			4:
				obr_4.visible = false
				obr_5.visible = true
				
			5:
				obr_5.visible = false
				obr_6.visible = true
				
			6:
				obr_6.visible = false
				obr_7.visible = true
			7:
				obr_7.visible = false
				obr_8.visible = true
				
			8:
				obr_8.visible = false
				obr_9.visible = true
				
			9:
				obr_9.visible = false
				obr_9.visible = true
				
		_state += 1


func _on_button_prijmout_pressed() -> void:
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://main.tscn")
