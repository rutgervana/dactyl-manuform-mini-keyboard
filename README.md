# Dactyl ManuForm Mini Keyboard

This is a fork of the [Dactyl-ManuForm-Mini](https://github.com/l4u/dactyl-manuform-mini-keyboard). The Dactyl-Manuform-Mini is a fork of the [Dactyl-Manuform](https://github.com/tshort/dactyl-keyboard), which is a fork of the [Dactyl](https://github.com/adereth/dactyl-keyboard) with the thumb cluster from [ManuForm](https://github.com/jeffgran/ManuForm).

## Features

Here is the list of features which have been added after the fork from the Dactyl Manuform Mini:

- The use of sidenubs is disabled by default. 
- Blackpill-F401 with GX12 connector holder (scad and stl files are provided). 
- OLED SSD1306 display holder (scad and stl files are provided. When changing the openscad model, it may need some repair. This can easily be achieved with meshlab)

### Option 1: Generate OpenSCAD and STL models

* Run `lein generate` or `lein auto generate`
* This will regenerate the `things/*.scad` files
* Use OpenSCAD to open a `.scad` file.
* Make changes to design, repeat `load-file`, OpenSCAD will watch for changes and rerender.
* When done, use OpenSCAD to export STL files
* Oled-holder needs to be repaired with Meshlab or other mesh software.
* The code in test-holders.scad can be used to roughly check the fit of the holders, add it onto the top in the right.scad file.

### Option 2: Use the stl files

Print right.stl, left.stl, right-plate.stl, left-plate.stl, oled-holder.stl and blackpill-f401-holder.stl.

## License

Copyright © 2015-2021 Matthew Adereth, Tom Short, Leo Lou, Quentin Lebastard and Rutger van Anrooij

The source code for generating the models is distributed under the [GNU AFFERO GENERAL PUBLIC LICENSE Version 3](LICENSE).


## Build log

Work in progress.

## Adding a knob
I used an EC11 knob, you need to connect its A and B lines to any of the pro micro's available pins as well as the GND.
Then, follow [qmk's guide](https://docs.qmk.fm/#/feature_encoders)

I printed an adapter for the encoder, it's made by [hellmoneywarriors on reddit](https://www.reddit.com/r/MechanicalKeyboards/comments/chs82g/designed_a_new_adapter_for_installing_rotary/?st=jzpioq7c&sh=33f65e95) and can be found here: https://www.thingiverse.com/thing:3770166


## Adding the rgb strip
I added one rgb led strip on each side, on pin D1. Each side has 10 rgbw leds.

I had to activate the following options in `config.h`:

```
#define RGB_DI_PIN D1
#define RGBLED_NUM 10
#define RGBLIGHT_ANIMATIONS
#define RGBW
#define RGBLIGHT_SPLIT
#define RGBLED_SPLIT { 10, 10 }
```

There is a guide in [qmk's official docs](https://beta.docs.qmk.fm/features/feature_rgblight)

## Flashing with QMK

The QMK source code for the keyboard will be provided in an other repository when available.


