# quickdrawhandgun
A very basic FiveM script that allows you to hold a hip holster and quickly draw a pistol (or anything in the "pistol" slot in the weapon wheel) while doing so.

## Usage
Press whatever keybind you've set it up to use. By default the key will be `Z`, however any user can change this in their own keybind settings. To draw a handgun/pistol/whatever is in the "pistol" slot, press `Right Mouse Button` or whatever keybind you have set up for `INPUT_AIM`. If you as a server administrator want to change the default holster animation keybind, you can do so by editing line 44 as follows: 

```lua
RegisterKeyMapping("+handonholster", "Hand on gun holster", "KEYBOARD", "Z")
```
to
```lua
RegisterKeyMapping("+handonholster", "Hand on gun holster", "KEYBOARD", "YOUR KEYBIND HERE")
```
See [here](https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/) for a full list of valid keybinds.

## License
Really, do whatever you want with this. It's 49 lines of *very* basic scripting. If you do improve on it though, feel free to make a PR! :)
