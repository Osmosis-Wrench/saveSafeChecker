# SaveSafeChecker

![example](https://github.com/Osmosis-Wrench/wabbaWidget/blob/main/example.png)

## What is this?

There are two builds of this project, a logging only and a message+logging version. If a user loads a save with a different major release number to their current modlist install version, it will either be logged to the console or it will show a message reminding the user that playing on an outdated save can result in save corruption. They are then given the option to ignore this warning, or return to the main menu to start a new game.

Supports mouse and controller input.

Both version write an error message to the users papyrus logs on every game load with an incorrect save version - modlist version match. If you want to check for this error, look for the following:

```log
    Error: Modlist save version incompatibility: SaveVersionNumber -_- ModlistVersionNumber
```

## How to use

Ensure you have SKSE and JContainers installed.

Edit ``ml.json`` to include your current major version number, and your modlist's name.
So if your modlist's current version is version 4.20 and it's name is High Skyrim you would edit ``ml.json`` to read like follows:

```json

{
  "modlistVersion": 4.20,
  "modlistName": "High Skyrim"
}

```

It's recommended that you merge this with one of your patches.

## Troubleshooting and FAQ

Make sure the value for ``modlistVersion`` is not inside quotation marks, and has a decimal place.

```json
 "modlistVersion": 4.20, // valid
 "modlistVersion": 1234.78, // valid
 "modlistVersion": 420, // invalid
 "modlistVersion": "4.20", // invalid
 ```

 Make sure the value of ``modlistName`` is inside quotation marks.

 ```json
 "modlistName": "High Skyrim", // valid
 "modlistName": High Skyrim, // invalid
 "modlistName": "High' Skyrim, // invalid
 ```

## Build Instructions

First build flash, then build papyrus.

### Flash

1. Open ``.\flash\wabbaMessage.fla`` in adobe CS6.
2. Hit Ctrl+Enter+f12 to publish

This should automatically place the compiled swf in the correct location for the papyrus compiler.

### Papyrus

1. Download latest version of [Pyro](https://github.com/fireundubh/pyro/releases)
2. Extract and add the extracted folder to your PATH. (You'll probably need to restart you PC.)
3. Run ``.\b.bat`` and the project should be in ``.\bin\``

If you have any issues with running `.\b.bat` you may need to generate a GitHub access token and change ``.\b.bat`` to read like this:

```batch
@Echo Off
Pyro.exe --access-token YOUR_GITHUB_TOKEN_HERE --force-overwrite "skyrim\saveChecker.ppj"
cmd /k
```
