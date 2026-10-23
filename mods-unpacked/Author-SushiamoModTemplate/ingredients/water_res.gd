extends IngredientRes

## Logic and definition of the Water ingredient
## It's like the Cucumber ingredient but with a lower bonus

const LOG_NAME := "Author-SushiamoModTemplate:Water" ## Make sure it's unique for each file

const ID := "INGREDIENT_WATER" # Follow the format "INGREDIENT_NAME"

const RES_PATH := "res://mods-unpacked/Author-SushiamoModTemplate/ingredients/water_res.gd"
const ICON_PATH := "res://mods-unpacked/Author-SushiamoModTemplate/ingredients/water.png"

## Create and register the ingredient
static func register() -> void:
	var water: IngredientRes = load(RES_PATH).new()
	water.id = ID
	water.name = "INGREDIENT_WATER_NAME"
	water.description = "INGREDIENT_WATER_DESC"
	water.baseFlavour = 4
	water.rarity = Rarity.Type.COMMON # Valid: [COMMON, UNCOMMON, RARE, LEGENDARY]
	water.alreadyUnlocked = true ## keep it true unless you also want to implement an unlock requirement for it... which is a bit more complicated :)
	water.icon = ImageTexture.create_from_image(Image.load_from_file(ICON_PATH))

	var types: Array[IngredientTypeRes] = []
	types.append(SushiaModContent.getIngredientTypeByID(IdDB.IngredientTypeID.VEGETARIAN))
	types.append(SushiaModContent.getIngredientTypeByID(IdDB.IngredientTypeID.TOPPING))
	# Valid types: [BASE, FISH, MEAT, RARE_FISH, TOPPING, VEGETARIAN, WRAPPER]
	water.types = types

	SushiaModContent.registerIngredient(water)
	ModLoaderLog.info("Registered the %s ingredient." % ID, LOG_NAME)

####################
# Ingredient Logic #
####################
func executeOnIngredient(me: Ingredient, allIngredients: Array[Ingredient]) -> Array[Event]:
	var otherVeggies := IngredientUtils.filterByType(allIngredients, IdDB.IngredientTypeID.VEGETARIAN, me)

	if otherVeggies.is_empty():
		return []

	var events: Array[Event] = []
	for otherVeg: Ingredient in otherVeggies:
		events.append_array(EzCardEvent.addIngFlavour(10).to(me).becauseOf(otherVeg).build())
		## No need for a pause because "EzCardEvent...becauseOf()" is awaited, in other cases like this you might need a pause here
	return events
