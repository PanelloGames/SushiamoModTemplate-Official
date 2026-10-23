# Copyright (c) 2026 Panello Games. All rights reserved.
# Licensed solely for creating mods for "Sushiamo" (Non-commercial use only).
# See README.md for full license terms.
class_name Event extends RefCounted

@warning_ignore_start("unused_parameter")

# Card Visuals
static func highlightCard(cardId: int) -> Event: return null
static func dimCard(cardId: int) -> Event: return null
static func shake(cardId: int) -> Event: return null
static func pop(cardId: int) -> Event: return null
static func cardTextShake(cardId: int, text: String, sound: Variant = null) -> Event: return null
static func cardTextPop(cardId: int, text: String, sound: Variant = null) -> Event: return null

# Card Lifecycle
static func cardDestroy(cardId: int) -> Event: return null
static func cardDestroyNoWait(cardId: int) -> Event: return null
static func breakCard(cardId: int) -> Event: return null
static func consumeSauceCard(cardId: int) -> Event: return null

# Synergies
static func synergyEffect(fromIds: Array, toId: int, color: Color, targetBubble: bool) -> Event: return null
static func customSynergy(fromGroup: String, toGroup: String, color: Color) -> Event: return null
static func synergyGroupToCard(fromGroup: String, toId: int, color: Color) -> Event: return null
static func synergyCardToGroup(fromId: int, toGroup: String, color: Color) -> Event: return null

# Dice rolls
static func diceCheck(cardId: int, success: bool, denominator: int, successIsBad: bool = false) -> Event: return null
static func diceCheckFast(cardId: int, success: bool, denominator: int, successIsBad: bool = false) -> Event: return null
static func diceValue(cardId: int, result: int, denominator: int) -> Event: return null

# Ingrediets Flavour Bubble
static func showIngBubble(cardId: int, amount: float) -> Event: return null
static func tallyIngBubble(cardId: int) -> Event: return null
static func shiftBubbles(cardId: int) -> Event: return null
static func balanceFlavourHype() -> Event: return null

# Money
static func addMoney(amount: float) -> Event: return null
static func addRunMoney(amount: float) -> Event: return null
static func looseMoney(amount: float) -> Event: return null

# Boss Events
static func bossMessage(text: String) -> Event: return null
static func bossMessageAsync(text: String) -> Event: return null
static func bossMultTotalScore(amount: float) -> Event: return null
static func bossClampTotalScore(percentage: float, text: String) -> Event: return null

# Pauses & Timing
static func microPause() -> Event: return null
static func smallerPause() -> Event: return null
static func pause() -> Event: return null
static func longPause() -> Event: return null
static func pauseMs(millis: float) -> Event: return null

# Audio & Messages / Misc
static func playSound(sound: Variant) -> Event: return null
static func showFullscreenMessage(text: String) -> Event: return null
static func sauceUseAborted() -> Event: return null

# Hacky lol 
static func deferred(callable: Callable) -> Event: return null

# Scoring Flow
static func initializeScore(flavour: float, hype: float) -> Event: return null
static func calculateTotal() -> Event: return null
static func transferToRound() -> Event: return null
static func clearPlate() -> Event: return null
