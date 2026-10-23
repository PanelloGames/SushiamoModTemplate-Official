extends Node

# Entry point of the mod

func _init() -> void:
	SushiaModContent.registerTranslations("res://mods-unpacked/Author-SushiamoModTemplate/strings.csv")
	load("res://mods-unpacked/Author-SushiamoModTemplate/ingredients/water_res.gd").register()
	load("res://mods-unpacked/Author-SushiamoModTemplate/tools/birthday_candle_res.gd").register()
	load("res://mods-unpacked/Author-SushiamoModTemplate/sauces/sparkling_water_res.gd").register()
