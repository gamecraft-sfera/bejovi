extends Node

enum GameState {START, NAKRM_KOCKU, SMS_PILULKA1, VEM_SI_PILULKU_1, SPAT1}

var game_state: GameState = GameState.START


func get_quest_desc() -> String:
	match game_state:
		GameState.START:
			return "Přečti si zprávu"
		GameState.NAKRM_KOCKU:
			return "Nakrm Kočku!"
		GameState.SMS_PILULKA1:
			return "Přečti si zprávu"
		GameState.VEM_SI_PILULKU_1:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT1:
			return "Běž spát"
			
	return ""
