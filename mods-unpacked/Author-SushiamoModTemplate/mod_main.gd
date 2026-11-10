extends Node

# Entry point of the mod
# NOTE: Use this function to install extensions and hooks
func _init() -> void:
	ModLoaderMod.install_script_extension("res://mods-unpacked/Author-SushiamoModTemplate/extensions/roe_res.gd")

# Called after the _init() and after all the game autoloads _init() as well
# NOTE: New content (tools, ingredients etc.) should be registered here
func _ready() -> void:
	SushiaModContent.registerTranslations("res://mods-unpacked/Author-SushiamoModTemplate/strings.csv")

	load("res://mods-unpacked/Author-SushiamoModTemplate/ingredients/water_res.gd").register()
	load("res://mods-unpacked/Author-SushiamoModTemplate/tools/birthday_candle_res.gd").register()
	load("res://mods-unpacked/Author-SushiamoModTemplate/sauces/sparkling_water_res.gd").register()
