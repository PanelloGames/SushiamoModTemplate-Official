# SushiamoModTemplate
Sample mod that adds an ingredient (Water), a tool (Birthday Candle), and a sauce (Sparkling Water).

The template will be expanded with more examples and apis as needed.

## Customizing the mod
- First edit the `manifest.json` to change the values
- Then you can edit the `.gd` files to change the behavior of the mod

## Packaging the mod
- Zip the `mods-unpacked` folder and name it like `Author-ModName-1.0.0.zip`
- Put the zip in the `/mods` folder of the game

## Internal Mod Structure
```
Author-SushiamoModTemplate-1.0.0.zip
└── mods-unpacked/
    └── Author-SushiamoModTemplate/
        ├── manifest.json     # The mod metadata read by the game
        ├── mod_main.gd       # Entry point of the mod, the mod loader calls _init()
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