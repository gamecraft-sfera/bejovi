extends Node

enum GameState {START, NAKRM_KOCKU, SMS_PILULKA1, VEM_SI_PILULKU_1, SPAT1, RANO2, KYTKAC, SMS_PILULKA2,
VEM_SI_PILULKU_2, VEM_SI_PILULKU_2_2, SPAT2, RANO3,
ODNES_KOCKU, KOCKA_ODNESENA,
VEM_SI_PILULKU_3, VEM_SI_PILULKU_3_2, VEM_SI_PILULKU_3_3, SPAT3, RANO4,
KYTKAA, SMS_PILULKA4,
VEM_SI_PILULKU_4, VEM_SI_PILULKU_4_2, VEM_SI_PILULKU_4_3, VEM_SI_PILULKU_4_4, SPAT4, RANO5,
VEM_SI_PILULKU_5, VEM_SI_PILULKU_5_2, VEM_SI_PILULKU_5_3, VEM_SI_PILULKU_5_4, VEM_SI_PILULKU_5_5, VEM_SI_PILULKU_5_6, VEM_SI_PILULKU_5_7,
VEM_SI_PILULKU_5_8,VEM_SI_PILULKU_5_9, VEM_SI_PILULKU_5_10, NEHLEDEJ}

var game_state: GameState = GameState.START


var voda: bool = false
var kocka: bool = false

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
		GameState.RANO2: #SMS3 zalit kytku C
			return "Přečti si zprávu"
		GameState.KYTKAC: #SMS3 zalit kytku C
			return "Zalyj kytku C"
		GameState.VEM_SI_PILULKU_2:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT2:
			return "Běž spát"
		GameState.RANO3:
			return "Přečti si zprávu"
		GameState.ODNES_KOCKU:
			return "Kočku do sklepa"
		GameState.KOCKA_ODNESENA:
			return "Přečti si zprávu"
		GameState.VEM_SI_PILULKU_3:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT3:
			return "Běž spát"
		GameState.RANO4:
			return "Přečti si zprávu"
		GameState.KYTKAA:
			return "Zalij kytku A"
		GameState.VEM_SI_PILULKU_4:
			return "Vem si pilulku (nebo ne?)"
		GameState.SPAT4:
			return "Běž spát"
		GameState.RANO5:
			return "Přečti si zprávu"
		GameState.VEM_SI_PILULKU_5:
			return "Vem si pilulku (nebo ne?)"
		GameState.NEHLEDEJ:
			return "Nehledej tajnou místnost"
			
	return ""
