extends Node

## In this node we store just the necessary global variales,
# like the country in the main/attack screen the user selected
# and the hacker name ##


## GLOBAL VARIABLES ##
var HACKER_COUNTRY: String = ''

var COUNTRY_TO_ATTACK: String = ''

var HACKER_NAME: String = ''

var CML_CHAR: String = ''

func update_CML_CHAR() -> void:
	CML_CHAR = "%s@cyhst:~$" % HACKER_NAME
