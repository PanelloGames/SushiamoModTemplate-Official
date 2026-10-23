# Copyright (c) 2026 Panello Games. All rights reserved.
# Licensed solely for creating mods for "Sushiamo" (Non-commercial use only).
# See README.md for full license terms.
class_name SushiaModContent extends RefCounted

## NOTE: You don't need any file from /apis inside the final mod zip, it's just used for reference while developing mods

## This is not the real game code but a "Stub" useful for reference
## You can use the functions in the mod for common stuff like adding a new ingredient or checking if the run is active

@warning_ignore_start("unused_parameter")

## Add new content to the game ##
static func registerIngredient(res: IngredientRes) -> void: pass
static func registerTool(res: ToolRes) -> void: pass
static func registerSauce(res: SauceRes) -> void: pass
static func registerBox(res: Resource) -> void: pass
static func registerModifier(res: Resource) -> void: pass
static func registerDeck(res: Resource) -> void: pass
static func registerNotebook(res: Resource) -> void: pass
static func registerEvent(res: Resource) -> void: pass
static func registerBoss(res: Resource) -> void: pass
static func registerUnlockRequirement(res: Resource) -> void: pass

## Translations ##
static func registerTranslations(csvFilePath: String) -> void: pass

## Utils ##
static func getIngredientTypeByID(id: String) -> Resource: return null
static func isRunActive() -> bool: return false
static func isDeckOverTheMinimumLimit() -> bool: return false

