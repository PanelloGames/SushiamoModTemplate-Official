extends ToolRes

## Logic and definition of the Birthday Candle tool
## I'ts like the original Blow Torch

const LOG_NAME := "Author-SushiamoModTemplate:BirthdayCandle" ## Make sure it's unique for each file

const ID := "TOOL_BIRTHDAY_CANDLE" # Follow the format "TOOL_NAME"

const RES_PATH := "res://mods-unpacked/Author-SushiamoModTemplate/tools/birthday_candle_res.gd"
const ICON_PATH := "res://mods-unpacked/Author-SushiamoModTemplate/tools/birthday_candle.png"

const STATE_HYPE := "CURRENT_HYPE"
const INITIAL_HYPE := 15
const HYPE_LOSS := 5

## Create and register the tool
static func register() -> void:
	var candle: ToolRes = load(RES_PATH).new()
	candle.id = ID
	candle.name = "TOOL_BIRTHDAY_CANDLE_NAME"
	candle.description = "TOOL_BIRTHDAY_CANDLE_DESC"
	candle.basePrice = 4
	candle.rarity = Rarity.Type.COMMON # Valid: [COMMON, UNCOMMON, RARE, LEGENDARY]
	candle.alreadyUnlocked = true ## keep it true unless you also want to implement an unlock requirement
	candle.icon = ImageTexture.create_from_image(Image.load_from_file(ICON_PATH))

	SushiaModContent.registerTool(candle)
	ModLoaderLog.info("Registered the %s tool." % ID, LOG_NAME)

##############
# Tool Logic #
##############

func initializeState(me: Tool) -> void:
	me.state[STATE_HYPE] = INITIAL_HYPE

func getDescription(me: Tool) -> String:
	var currentHype: int = me.getState(STATE_HYPE, INITIAL_HYPE)
	return tr(description).format({
		"CURRENT_HYPE": UtilsNumbers.formatNumber(currentHype),
		"HYPE_LOSS": HYPE_LOSS
	})

func executeOnScoring(me: Tool, _ingredients: Array[Ingredient]) -> Array[Event]:
	var currentHype: int = me.getState(STATE_HYPE, INITIAL_HYPE)
	return EzCardEvent.addGlobalHype(currentHype).to(me).build()

func executeOnRoundEnd(me: Tool) -> Array[Event]:
	if me.isIndestructible():
		return []

	var events: Array[Event] = [
		me.decreaseState(STATE_HYPE, HYPE_LOSS)
	]

	if me.getState(STATE_HYPE, 0) <= 0:
		events.append(Event.cardTextShake(me.instanceId, tr("TOOL_BIRTHDAY_CANDLE_MSG_BLOWN_OUT"), SoundLib.Sound.ERROR))
		events.append(Event.breakCard(me.instanceId))
		events.append(Event.deferred(func() -> void: RunData.destroyTool(me)))

	return events
