# SushiamoModTemplate
Sample mod that adds an ingredient (Water), a tool (Birthday Candle), and a sauce (Sparkling Water).
Also shows how to override vanilla content using extensions.

Read this to understand how to setup the project and test your mods https://wiki.godotmodding.com/#mod-developer

## Modding Support
Sushiamo comes preloaded with https://wiki.godotmodding.com/ so you dont need to edit the game to add modding support, just create a mod and it will work!

## Customizing the mod
- First edit the `manifest.json` to change the values
- Then you can edit the `.gd` files to change the behavior of the mod

## Mod lifecycle
- `_init()` runs before vanilla resources are loaded: Use it to install script extensions/hook etc.
- `_ready()` runs after all autoloads have initialized: Register new content (ingredients, tools...) there.

## Packaging the mod
- Zip the `mods-unpacked` folder and name it like `Author-ModName-1.0.0.zip`
- Put the zip in the `/mods` folder of the game

## Internal Mod Structure
```
Author-SushiamoModTemplate-1.0.0.zip
└── mods-unpacked/
    └── Author-SushiamoModTemplate/
        ├── manifest.json     # The mod metadata read by the game
        ├── mod_main.gd       # Entry point of the mod, the mod loader calls _init() and then _ready()
```

## Where zipped mods go 
```
(This is the game folder)
Sushiamo.exe
mods/
    └── Author-SushiamoModTemplate-1.0.0.zip
    └── ...other-mods.zip
```


## Bonus: To test a mod without having to zip it every time you change something you can do this:
```
(This is inside the game folder)
Sushiamo.exe
mods-unpacked/
    └── Author-SushiamoModTemplate/
        ├── manifest.json
        └── mod_main.gd
```

# License
```
You are granted permission to use, copy, modify, and distribute these files solely for the purpose of creating mods for the game "Sushiamo". 
Any modified or distributed versions of these files must retain this original copyright notice and license text.

NON-COMMERCIAL RESTRICTION:
You may NOT use these files, or any modified version of these files, for any commercial purpose. This includes, but is not limited to:
- Selling the mod.
- Locking the mod behind a mandatory paywall, subscription service (such as Patreon or Ko-fi), or early-access tier.
- Using this code in a standalone commercial game.
- Integrating this code into another game.

TERMINATION:
Panello Games reserves the right to revoke this permission at any time, if the modification contains offensive, malicious, or harmful content.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
```