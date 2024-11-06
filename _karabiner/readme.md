# Karabiner-Elements
You need a json file to customize your keyboard using Complex modifications in Karabiner-Elements.

## File Description

There are two json files to change keys at `.config/karabiner/assets/complex_modifications`.

### `MacHangul.json`
It's the settings file to use language conversion key on MacBook's internal keyboard 

- Change **Right Command** key to **Kor/Eng(한/영)** key 
  - Switch keyboard language.
- Change **Right Option** key to **emoji** and **Hanja(한자)** key 
- Change **Caps Lock** key to **ESC** key

  - Give it a short press, it will open a Character Viewer that can use emojis and special characters.
  - If a long press and the letter to the left of the cursor is Hangul, it will be used as a Chinese character key that can change Hangul to Hanja.  

| Default | **Result**       |
| :-----: | :-----------: |
| Right Command | Switch Kor/Eng(한/영) |
| Right Option | Emoji(short) & Hanja(한자)(long) |
| Caps Lock | ESC |

### `TM860BL.json`
This file changes the Bluetooth-connected TM860 keyboard (for Windows) to Mac keyboard without driver program.

| Default | **Result**       |
| :-----: | :-----------: |
| Left Command | Left Option |
| Left Alt | Left Command |
| Right Option | Switch Kor/Eng(한/영) |
| Right Control | moji(short) & Hanja(한자)(long) |
| CapsLock | ESC |
| CapsLock+Shift | ESC |
| ESC | ` |
| ESC + Shift  | ~ |
| PageUp | Insert |
| PageDown | Delete |
| Del | Mac's Screenshot |
| Del (long press) | Mac's fn key |

> :warning: It may not work properly.

> :warning: **Warning**
> The Vendor ID may change depending on the connection method. If you are using `type: device_if`, make sure to check the **Vendor ID** in the Devices tab and update the configuration file to reflect the changed Vendor ID.
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
