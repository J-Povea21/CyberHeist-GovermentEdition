extends Node

## In this node we store just the necessary global variales,
# like the country in the main/attack screen the user selected
# and the hacker name ##



## GLOBAL VARIABLES ##
var HACKER_COUNTRY: String = ''

var COUNTRY_TO_ATTACK: String = ''

var HACKER_NAME: String = ''

var CML_CHAR: String = ''

## PUBLIC METHODS ##
func set_CML_CHAR() -> void:
	CML_CHAR = "%s@cyhst:~$" % HACKER_NAME

func set_hacker_name(name: String) -> void:
	self.HACKER_NAME = name
	
func set_hacker_country(country: String) -> void:
	self.HACKER_COUNTRY = _complete_country_name(country)

func set_country_to_attack(country: String) -> void:
	self.COUNTRY_TO_ATTACK  = _complete_country_name(country)

## PRIVATE METHODS ##
func _complete_country_name(name: String) -> String:
	var complete_name = ''
	
	match name:
		"Col": complete_name = 'Colombia'
		"Deu": complete_name = 'Alemania'
		"Arg": complete_name = 'Argentina'
		"Brz": complete_name = 'Brazil'
		"Ind": complete_name = 'India'
		"Can": complete_name = "Canadá"
		"Chi": complete_name = "Chile"
		"Usa": complete_name = "Estados Unidos"
		"Rus": complete_name = "Rusia"
		"Mex": complete_name = "México"
		_:
			complete_name = "Colombia"
	return complete_name
