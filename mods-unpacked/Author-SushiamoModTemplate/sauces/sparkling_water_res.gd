extends ReusableSauceRes

## Logic and definition of the Sparkling Water sauce
## It's like the Mayo sauce

const LOG_NAME := "Author-SushiamoModTemplate:SparklingWater" ## Make sure it's unique for each file

const ID := "SAUCE_SPARKLING_WATER" # Follow the format "SAUCE_NAME"

const RES_PATH := "res://mods-unpacked/Author-SushiamoModTemplate/sauces/sparkling_water_res.gd"
const ICON_PATH := "res://mods-unpacked/Author-SushiamoModTemplate/sauces/sparkling_water.png"

const FLAVOUR_BONUS := 100

## Create and register the sauce
static func register() -> void:
	var sauce: ReusableSauceRes = load(RES_PATH).new()
	sauce.id = ID
	sauce.name = "SAUCE_SPARKLING_WATER_NAME"
	sauce.description = "SAUCE_SPARKLING_WATER_DESC"
	sauce.basePrice = 4
	sauce.cooldown = 1
	sauce.targetType = SauceRes.TargetCategory.ROUND # Valid: [ROUND, INGREDIENTS, GLOBAL]
	sauce.rarity = Rarity.Type.COMMON # Valid: [COMMON, UNCOMMON, RARE, LEGENDARY]
	sauce.alreadyUnlocked = true ## keep it true unless you also want to implement an unlock requirement
	sauce.icon = ImageTexture.create_from_image(Image.load_from_file(ICON_PATH))

	SushiaModContent.registerSauce(sauce)
	ModLoaderLog.info("Registered the %s sauce." % ID, LOG_NAME)

###############
# Sauce Logic #
###############

func requiresSelection() -> bool:
	return false

func executeUse(me: Sauce, _ingredients: Array[Ingredient] = [], _selected: Array[Ingredient] = []) -> Array[Event]:
	me.hasPendingScoringEffect = true
	return [Event.cardTextPop(me.instanceId, tr("SAUCE_MSG_ACTIVATED"), SoundLib.Sound.MECHANISM)]

func executeOnScoring(me: Sauce, _allIngredients: Array[Ingredient]) -> Array[Event]:
	if not me.hasPendingScoringEffect:
		return []

	var events: Array[Event] = []
	events.append_array(EzCardEvent.addGlobalFlavour(FLAVOUR_BONUS).to(me).build())
	events.append(EzChangeItem.change(me, func(s: Sauce) -> void: s.hasPendingScoringEffect = false))
	return events
