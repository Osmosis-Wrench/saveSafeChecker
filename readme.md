# WabbaWidget

## What is this?

This is a tool to detect and warn wabbajack modlist users if they've updated to a new version of a modlist on the same save. This shows a custom menu to the user warning them that proceeding with that save voids all support, then gives them the option to either return to the main menu or ignore the warning and never see it again.

Supports mouse and controller input.

It also writes an error message to the users papyrus logs on every game load with an incorrect save version - modlist version match. If you want to check for this error, look for the following:

```log
    Error: file failed to fail with error code: SaveVersionNumber -_- ModlistVersionNumber
```

Also, if you want a custom version of the widget for something else, or want to theme it to your modlist hmu in apoc and i'll help you out when I have time. Or feel free to fork and do whatever with the project. Should have everything you need to build the mod, including pyro project file.

## How to use

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
