extends Node3D

var _psycho: float = 0
var _prisery: int = 0

func _ready() -> void:
	_update_game_state()
	
	if Global.game_state == Global.GameState.START:
		%TelefonButton.visible = true

func _input(event: InputEvent) -> void:
	pass
	#if event.is_pressed():
	#	_sleep_anim()

func _update_game_state() -> void:
	%QuestLabel.text = Global.get_quest_desc()

func _on_telefon_button_pressed() -> void:
	if Global.game_state == Global.GameState.SMS_PILULKA1:
		%SMS2.visible = true
		
	if Global.game_state == Global.GameState.RANO2:
		%SMS3.visible = true
		
	if Global.game_state == Global.GameState.SMS_PILULKA2:
		%SMS4.visible = true
		
	if Global.game_state == Global.GameState.RANO3:
		%SMS5.visible = true
		
	if Global.game_state == Global.GameState.KOCKA_ODNESENA:
		%SMS6.visible = true
		
	if Global.game_state == Global.GameState.RANO4:
		%SMS7.visible = true
		# TODO ZOBRAZ KOSTRU KOCKY
	
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
		
	if Global.game_state == Global.GameState.RANO2:
		await _hide_telefon()
		Global.game_state = Global.GameState.KYTKAC
		
	if Global.game_state == Global.GameState.SMS_PILULKA2:
		await _hide_telefon()
		Global.game_state = Global.GameState.VEM_SI_PILULKU_2
		_show_vem_si_pilulku()
		
		
	if Global.game_state == Global.GameState.RANO3:
		await _hide_telefon()
		Global.game_state = Global.GameState.ODNES_KOCKU
		
		
	if Global.game_state == Global.GameState.KOCKA_ODNESENA:
		await _hide_telefon()
		Global.game_state = Global.GameState.VEM_SI_PILULKU_3
		_show_vem_si_pilulku()
		
		
	if Global.game_state == Global.GameState.RANO4:
		await _hide_telefon()
		Global.game_state = Global.GameState.KYTKAA
		
		
		
		
	if Global.game_state == Global.GameState.RANO5:
		await _hide_telefon()
		Global.game_state = Global.GameState.VEM_SI_PILULKU_5
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
	_increase_psycho()
	_hide_vem_si_pilulku()
	_move_state()


func _on_neber_pilulku_button_pressed() -> void:
	_hide_vem_si_pilulku()
	#_increase_psycho()
	_prisery += 1
	_move_state()
	
func _move_state():
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_1:
		Global.game_state = Global.GameState.SPAT1
		
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_2:
		Global.game_state = Global.GameState.VEM_SI_PILULKU_2_2
		_show_vem_si_pilulku()
		
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_2_2:
		Global.game_state = Global.GameState.SPAT2
		
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_3:
		Global.game_state = Global.GameState.VEM_SI_PILULKU_3_2
		_show_vem_si_pilulku()
		
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_3_2:
		Global.game_state = Global.GameState.VEM_SI_PILULKU_3_3
		_show_vem_si_pilulku()
		
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_3_3:
		Global.game_state = Global.GameState.SPAT3
		
		
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_4:
		Global.game_state = Global.GameState.SPAT4
		
	if Global.game_state == Global.GameState.VEM_SI_PILULKU_5:
		Global.game_state = Global.GameState.SPAT5
		
		
	if Global.game_state == Global.GameState.RANO2:
		%TelefonButton.visible = true
	if Global.game_state == Global.GameState.RANO3:
		%TelefonButton.visible = true
	if Global.game_state == Global.GameState.RANO4:
		%TelefonButton.visible = true
	if Global.game_state == Global.GameState.RANO5:
		%TelefonButton.visible = true
		
		
	_update_game_state()

func _increase_psycho():
	_psycho += 0.1
	#_set_psycho()
	
func _lower_psycho():
	_psycho = max(0, _psycho - 0.1)
	#_set_psycho()
	
func _set_prisery():
	$Priserky1.visible = _prisery > 0
	$Priserky2.visible = _prisery > 1
	$Priserky3.visible = _prisery > 2
	$Priserky4.visible = _prisery > 3
	$Priserky5.visible = _prisery > 4
	
func _set_psycho():
	$CanvasLayer3/EffectDuha.visible = _psycho > 0
	$CanvasLayer4/EffectEye. visible = _psycho > 0
	
	($CanvasLayer3/EffectDuha.material as ShaderMaterial).set_shader_parameter("pruhlednost", _psycho)
	($CanvasLayer4/EffectEye.material as ShaderMaterial).set_shader_parameter("open_amount", 1 - _psycho)
	

func _sleep():
	if Global.game_state == Global.GameState.SPAT1:
		await _sleep_anim()
		Global.game_state = Global.GameState.RANO2
		_update_game_state()
		_set_psycho()
		_set_prisery()
		_move_state()
		
	if Global.game_state == Global.GameState.SPAT2:
		await _sleep_anim()
		Global.game_state = Global.GameState.RANO3
		_update_game_state()
		_set_psycho()
		_set_prisery()
		_move_state()
		
	if Global.game_state == Global.GameState.SPAT3:
		await _sleep_anim()
		Global.game_state = Global.GameState.RANO4
		_update_game_state()
		_set_psycho()
		_set_prisery()
		_move_state()
		
	if Global.game_state == Global.GameState.SPAT4:
		await _sleep_anim()
		Global.game_state = Global.GameState.RANO5
		_update_game_state()
		_set_psycho()
		_set_prisery()
		_move_state()
		
	if Global.game_state == Global.GameState.SPAT5:
		await _sleep_anim()
		Global.game_state = Global.GameState.RANO6
		_update_game_state()
		_set_psycho()
		_set_prisery()
		_move_state()

func _on_sleep_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		_sleep()

func _sleep_anim() -> void:
	
	$CanvasLayer4/EffectEye.visible = true
	var start: float = ($CanvasLayer4/EffectEye.material as ShaderMaterial).get_shader_parameter("open_amount")
	var set_open := func(value: float) -> void:
		($CanvasLayer4/EffectEye.material as ShaderMaterial).set_shader_parameter("open_amount", value)
		
	var tween := create_tween()
	tween.tween_method(set_open, start, 0.0, 0.5)
	tween.tween_interval(0.7)
	tween.tween_method(set_open, 0.0, 1.0 - _psycho, 0.5)
	await tween.finished


func _on_kytka_c_zalito() -> void:
	Global.voda = false
	Global.game_state = Global.GameState.SMS_PILULKA2
	_update_game_state()
	%TelefonButton.visible = true
	
func _on_kocka_ve_sklepe() -> void:
	Global.kocka = false
	Global.game_state = Global.GameState.KOCKA_ODNESENA
	_update_game_state()
	%TelefonButton.visible = true

func _on_kytka_a_zalito() -> void:
	Global.voda = false
	Global.game_state = Global.GameState.SMS_PILULKA4
	_update_game_state()
	%TelefonButton.visible = true
