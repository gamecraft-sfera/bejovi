extends Node3D


func _ready() -> void:
	_update_game_state()
	
	if Global.game_state == Global.GameState.START:
		%TelefonButton.visible = true

func _update_game_state() -> void:
	%QuestLabel.text = Global.get_quest_desc()

func _on_telefon_button_pressed() -> void:
	if Global.game_state == Global.GameState.SMS_PILULKA1:
		%SMS2.visible = true
	
	_show_telefon()

func _show_telefon():
	%TelefonButton.visible = false
	%TelefonCanvas/Telefon.visible = true
	%TelefonCanvas/AnimationPlayer.play("telefon")
	%TelefonCanvas.zobrazeno = true

func _hide_telefon():
	%TelefonCanvas/AnimationPlayer.play_backwards("telefon")
	await %TelefonCanvas/AnimationPlayer.animation_finished

func _on_close_button_pressed() -> void:
	if Global.game_state == Global.GameState.START:
		await _hide_telefon()
		Global.game_state = Global.GameState.NAKRM_KOCKU
		
	if Global.game_state == Global.GameState.SMS_PILULKA1:
		await _hide_telefon()
		Global.game_state = Global.GameState.VEM_SI_PILULKU_1
		_show_vem_si_pilulku()
		
	_update_game_state()

func _show_vem_si_pilulku():
	%Ruka.visible = true
	%VemPilulkuButton.visible = true
	%NeberPilulkuButton.visible = true
	
func _hide_vem_si_pilulku():
	%Ruka.visible = false
	%VemPilulkuButton.visible = false
	%NeberPilulkuButton.visible = false
		
func _krmeni() -> void:
	if Global.game_state == Global.GameState.NAKRM_KOCKU:
		$Granule1.visible = true
		$pytel_granuli.visible = false
		%TelefonButton.visible = true
		Global.game_state = Global.GameState.SMS_PILULKA1
		_update_game_state()
		

func _on_krmeni_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		_krmeni()


func _on_vem_pilulku_button_pressed() -> void:
	%Ruka.play("default")
	await get_tree().create_timer(1.0).timeout
	%Ruka.stop()
	_lower_psycho()
	_hide_vem_si_pilulku()
	_move_state()


func _on_neber_pilulku_button_pressed() -> void:
	_hide_vem_si_pilulku()
	_increase_psycho()
	_move_state()
	
func _move_state():
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_1:
		Global.game_state = Global.GameState.VEM_SI_PILULKU_1
		_show_vem_si_pilulku()
		
	_update_game_state()

var _psycho: float = 0

func _increase_psycho():
	_psycho += 0.1
	_set_psycho()
	
func _lower_psycho():
	_psycho = max(0, _psycho - 0.1)
	_set_psycho()
	
func _set_psycho():
	$CanvasLayer3/EffectDuha.visible = _psycho > 0
	$CanvasLayer4/EffectEye. visible = _psycho > 0
	
	($CanvasLayer3/EffectDuha.material as ShaderMaterial).set_shader_parameter("pruhlednost", _psycho)
	($CanvasLayer4/EffectEye.material as ShaderMaterial).set_shader_parameter("open_amount", 1 - _psycho)
	
