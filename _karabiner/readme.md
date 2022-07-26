# Karabiner-Elements
You need a json file to customize your keyboard using Complex modifications in Karabiner-Elements.

## File Description

There are two json files to change keys at `.config/karabiner/assets/complex_modifications`.

### `MacHangul.json`
It's the settings file to use language conversion key on MacBook's internal keyboard 

- Change **Right Command** key to **Kor/Eng(한/영)** key 
  - Switch keyboard language.
- Change **Right Option** key to **emoji** and **Hanja(한자)** key. 

  - Give it a short press, it will open a Character Viewer that can use emojis and special characters.
  - If a long press and the letter to the left of the cursor is Hangul, it will be used as a Chinese character key that can change Hangul to Hanja.  


### `TM860BL.json`
This file changes the Bluetooth-connected TM860 keyboard (for Windows) to Mac keyboard without driver program.

| Default | **Result**       |
| :-----: | :-----------: |
| ESC | ` |
| ESC + Shift  | ~ |
| CapsLock+Shift | ESC |
| PageDown | Delete |
| PageUp | Insert |
| Del | Screenshot app |
| Del (long press) | Mac's fn key |

> :warning: It may not work properly.

> :warning: **Warning** The keyboard has 3 connection methods.  
> If you connect in a way other than bluetooth, the changed Vendor ID of the Devices tab must be reflected in the file.  
> In my case, the device name has also been changed.

You can edit the json files for additional functions.

## Tips for Customizing
You can find key_code, consumer_key_code and pointing_button names by Karabiner-EventViewer.

```
"from": { 
	"key_code": "lang1",
	"modifiers": { "optional": [ "caps_lock" ] }
	},
"to": [ { "key_code": "right_option" }]
```
This mean:
```
(caps_lock)+lang1 => right_option
```
### from.modifiers

| key           | required   | description       | to event               |
| :-----------: | :--------: | :---------------: | :-:                    |
| `mandatory`   | optional   | must be pressed   | removed from to events |
| `optional`    | optional   | can be pressed    | kept in to events      |

### more info

https://karabiner-elements.pqrs.org/docs/
