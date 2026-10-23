# Copyright (c) 2026 Panello Games. All rights reserved.
# Licensed solely for creating mods for "Sushiamo" (Non-commercial use only).
# See README.md for full license terms.
class_name IngredientRes extends Resource

@warning_ignore_start("unused_parameter")

## Base class for custom ingredient resources.
## Override the methods below in your custom ingredient script (e.g. water_res.gd).

@export var id: String = "" ## Unique ID. E.g. "INGREDIENT_WATER"
@export var name: String = "" ## Translation key E.g. "Water" or "INGREDIENT_WATER_NAME"
@export_multiline var description: String = "" ## Text/key with tokens like {f}, {h}, {veg}. E.g. "{f}+10{} flavour"
@export var baseFlavour: int = 0 ## Base flavour score. E.g. 4
@export var rarity: int = 0 ## Enum [COMMON, UNCOMMON, RARE, LEGENDARY]. E.g. Rarity.Type.COMMON
@export var types: Array = [] ## E.g. [SushiaModContent.getIngredientTypeByID("VEGETARIAN")]. Valid: BASE, FISH, MEAT, RARE_FISH, TOPPING, VEGETARIAN, WRAPPER
@export var icon: Texture2D ## Card texture. E.g. ImageTexture.create_from_image(Image.load_from_file(path))
@export var alreadyUnlocked: bool = true ## true if unlocked by default. Set false only if adding an unlock requirement


## Initialize custom state in me.state (e.g. counters, dynamic data).
func initializeState(me: Ingredient) -> void:
	pass

## Returns tooltip description. Override only if you need dynamic text
func getDescription(me: Ingredient) -> String:
	return tr(description)

## Called for an ingredient while it is being scored
## Example use: Give a bonus because of some condition, like a fish ingredient in the sushi
## NOTE: `allIngredients` includes `me`
## NOTE: Ingredients passed here are CLONES, use [EzChangeItem] if you need to change them
## NOTE: Will be called again when RETRIGGERING this ingredient
func executeOnIngredient(me: Ingredient, allIngredients: Array[Ingredient]) -> Array[Event]:
	return []

## Called when another ingredient in the sushi is scored
## Example use: Give some bonus to other ingredients like the rice giving x2 to another ing flavour
## NOTE: `allIngredients` includes `me`
## NOTE: Ingredients passed here are CLONES, use [EzChangeItem] if you need to change them
## NOTE: Will be called again when RETRIGGERING this ingredient
func executeOnOtherIngredient(me: Ingredient, target: Ingredient, allIngredients: Array[Ingredient]) -> Array[Event]:
	return []

## Triggered after the total score of the sushi was calculated
## Example use: Change the ingredient in some ways after scoring (like destryoing it)
## NOTE: `allIngredients` includes `me`
## NOTE: Ingredients passed here are CLONES, use [EzChangeItem] if you need to change them
func executeIngredientAfterScoring(me: Ingredient, allIngredients: Array[Ingredient]) -> Array[Event]:
	return []
