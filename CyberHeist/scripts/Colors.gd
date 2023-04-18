extends Node


enum TYPES{
	ERROR,
	SYSTEM,
	SUCCESS
}

const _SYSTEM_COLOR = Color("#18D8D9")
const _ERROR_COLOR = Color("#D92338")
const _SUCCESS_COLOR = Color("#2ADD4D")

func apply_color(text: String, type: TYPES) -> String:
	
	var formated_text = text
	match type:
		TYPES.ERROR:
			formated_text = "[color=#%s]%s [/color]" % \
			[_ERROR_COLOR.to_html(), formated_text]
		
		TYPES.SYSTEM:
			formated_text = "[color=#%s]%s [/color]" % \
			[_SYSTEM_COLOR.to_html(), formated_text]
			
		TYPES.SUCCESS:
			formated_text = "[color=#%s]%s [/color]" % \
			[_SUCCESS_COLOR.to_html(), formated_text]	
	
	return formated_text	
