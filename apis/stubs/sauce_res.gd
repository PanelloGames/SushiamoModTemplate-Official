# Copyright (c) 2026 Panello Games. All rights reserved.
# Licensed solely for creating mods for "Sushiamo" (Non-commercial use only).
# See README.md for full license terms.
class_name SauceRes extends Resource

@warning_ignore_start("unused_parameter")

## Base class for custom sauce resources.

enum TargetCategory {
	INGREDIENTS, ## Effect executed on ingredients visible on screen (usually only in boxes/rewards/services)
	GLOBAL,      ## Can be used any time during a run
	ROUND,       ## Can only be used inside a service
}

@export var id: String = "" ## Unique ID. E.g. "SAUCE_SPARKLING_WATER"
@export var name: String = "" ## Translation key. E.g. "SAUCE_SPARKLING_WATER_NAME"
@export_multiline var description: String = "" ## Text/key with tokens like {f}, {h}. E.g. "{f}+100{} flavour"
@export var basePrice: int = 4 ## Cost in the market
@export var cooldown: int = 1 ## Services to wait before using again
@export var rarity: int = 0 ## Enum [COMMON, UNCOMMON, RARE, LEGENDARY]. E.g. Rarity.Type.COMMON
@export var icon: Texture2D ## Card texture. E.g. ImageTexture.create_from_image(Image.load_from_file(path))
@export var alreadyUnlocked: bool = true ## true if unlocked by default
@export var targetType: TargetCategory = TargetCategory.ROUND

## Returns the tooltip description. Override only if you need dynamic text
func getDescription(me: Sauce) -> String:
	return tr(description)

## Used to check if the sauce can be used or not
func canUse(me: Sauce, ingredients: Array[Ingredient] = [], selected: Array[Ingredient] = []) -> bool:
	return true

## Whether the sauce requires selecting ingredients before using (sometimes true for sauce with TargetCategory=INGREDIENTS)
func requiresSelection() -> bool:
	return false

## Called when the USE button of the sauce is clicked by the player
func executeUse(me: Sauce, ingredients: Array[Ingredient] = [], selected: Array[Ingredient] = []) -> Array[Event]:
	return []

## Called when the sushi scores
func executeOnScoring(me: Sauce, allIngredients: Array[Ingredient]) -> Array[Event]:
	return []
