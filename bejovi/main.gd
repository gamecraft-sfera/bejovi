extends Node2D

var pocitadlo =0

func kontrola_pocitadla() -> void:
	pocitadlo = pocitadlo +1
	if pocitadlo == 5:
		$konec.visible = true
		$dárek.visible = true

func _on_texture_button_pressed() -> void:
	kontrola_pocitadla()
	$pocitadlo.text = str(pocitadlo) + "/5"
	$panaček.visible = false
	$Label.visible = true
	$Timer.start()
	

func _on_panaček_2_pressed() -> void:
	kontrola_pocitadla()
	$pocitadlo.text = str(pocitadlo) + "/5"
	$panaček2.visible = false
	$Label.visible = true
	$Timer.start()

func _on_timer_timeout() -> void:
	$Label.visible = false

func _on_timer2_timeout() -> void:
	$Label3.visible = false

func _on_panaček_3_pressed() -> void:
	kontrola_pocitadla()
	$pocitadlo.text = str(pocitadlo) + "/5"
	$panaček3.visible = false
	$Label.visible = true
	$Timer.start()

func _on_panaček_4_pressed() -> void:
	kontrola_pocitadla()
	$pocitadlo.text = str(pocitadlo) + "/5"
	$panaček4.visible = false
	$Label.visible = true
	$Timer.start()
	
func _on_panaček_5_pressed() -> void:
	kontrola_pocitadla()
	$pocitadlo.text = str(pocitadlo) + "/5"
	$panaček5.visible = false
	$Label.visible = true
	$Timer.start()

func _on_dárek_pressed() -> void:
	$Label3.visible = true
	$dárek.visible = false
	$Timer2.start()
	


func _on_timer_2_timeout() -> void:
	$Label3.visible = false
	
