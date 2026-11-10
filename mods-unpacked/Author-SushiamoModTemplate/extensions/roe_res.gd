extends "res://resources/ingredients/logic/roe_res.gd"

## Example script extension which changes the vanilla roe ingredient logic

# Call the original function with super(me) and append some text
func getDescription(me: Ingredient) -> String:
	return super(me) + " " + "\n {c:WARNING}Modded!{}"

# Completely override the vanilla function 
func executeOnIngredient(me: Ingredient, _allIngredients: Array[Ingredient]) -> Array[Event]:
	return EzCardEvent.addGlobalHype(9).to(me).build()
