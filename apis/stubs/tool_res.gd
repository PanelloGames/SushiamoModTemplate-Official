# Copyright (c) 2026 Panello Games. All rights reserved.
# Licensed solely for creating mods for "Sushiamo" (Non-commercial use only).
# See README.md for full license terms.
class_name ToolRes extends Resource

@warning_ignore_start("unused_parameter")

## Base class for custom tool resources.
## Override the methods below in your custom tool script (e.g. birthday_candle_res.gd).

@export var id: String = "" ## Unique ID. E.g. "TOOL_BIRTHDAY_CANDLE"
@export var name: String = "" ## Translation key E.g. "TOOL_BIRTHDAY_CANDLE_NAME"
@export_multiline var description: String = "" ## Text/key with tokens like {h}, {f}. E.g. "{h}+15{} hype"
@export var basePrice: int = 4 ## Cost in the market
@export var rarity: int = 0 ## Enum [COMMON, UNCOMMON, RARE, LEGENDARY]. E.g. Rarity.Type.COMMON
@export var icon: Texture2D ## Card texture. E.g. ImageTexture.create_from_image(Image.load_from_file(path))
@export var alreadyUnlocked: bool = true ## true if unlocked by default. Set false only if adding an unlock requirement
@export var canBeDoubled: bool = false ## If true, this tool can appear as a Doubled edition
@export var canBeRepeated: bool = false ## If true, this tool can appear as a Repeated edition


## Initialize dynamic state in me.state
func initializeState(me: Tool) -> void:
	pass

## Returns tooltip description. Override only if you need dynamic text (e.g. showing some stat that changes)
func getDescription(me: Tool) -> String:
	return tr(description)

## Called when the round starts
func executeOnRoundStart(me: Tool) -> Array[Event]:
	return []

## Called before scoring calculations start
func executeBeforeScoring(me: Tool, ingredients: Array[Ingredient]) -> Array[Event]:
	return []

## Called after each ingredient is scored
# RETRIGGERABLE
func executeOnIngredientScoring(me: Tool, ingredient: Ingredient, allIngredients: Array[Ingredient]) -> Array[Event]:
	return []

## Called after all ingredients have been processed, before the total is calculated
func executeOnScoring(me: Tool, ingredients: Array[Ingredient]) -> Array[Event]:
	return []

## Called after scoring process is finished and total has been calculated
func executeAfterScoring(me: Tool, ingredients: Array[Ingredient]) -> Array[Event]:
	return []

## Called when a round is won, before showing round results
func executeOnRoundEnd(me: Tool) -> Array[Event]:
	return []

## Called whenever a card is discarded
func executeOnDiscard(me: Tool) -> Array[Event]:
	return []

## Called whenever money is spent
func executeOnMoneySpent(me: Tool, amount: float) -> Array[Event]:
	return []

## Called when entering the shop
func onShopEntered(me: Tool) -> void:
	pass

## Called when the tool is sold
func onSell(me: Tool) -> Array[Event]:
	return []

## Called when an ingredient is added to the deck
func executeOnIngredientAddedToPantry(me: Tool, ingredient: Ingredient) -> Array[Event]:
	return []

## Modify game values (e.g. Value.Type.SHOP_ITEMS_COUNT)
func changeValue(me: Tool, type: Value.Type, currentValue: Variant) -> Variant:
	return currentValue
