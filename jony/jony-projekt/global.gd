extends Node

enum GameState {START, NAKRM_KOCKU, SMS_PILULKA1, VEM_SI_PILULKU_1, SPAT1, RANO2,
VEM_SI_PILULKU_2, SPAT2, RANO3,
VEM_SI_PILULKU_3, SPAT3, RANO4,
VEM_SI_PILULKU_4, SPAT4, RANO5,
VEM_SI_PILULKU_5, SPAT5, RANO6}

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
		GameState.RANO2:
			return "Další úkol"
		GameState.VEM_SI_PILULKU_2:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT2:
			return "Běž spát"
		GameState.RANO3:
			return "Další úkol"
		GameState.VEM_SI_PILULKU_3:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT3:
			return "Běž spát"
		GameState.RANO4:
			return "Další úkol"
		GameState.VEM_SI_PILULKU_4:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT4:
			return "Běž spát"
		GameState.RANO5:
			return "Další úkol"
		GameState.VEM_SI_PILULKU_5:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT5:
			return "Běž spát"
		GameState.RANO6:
			return "KONEC"
			
	return ""
