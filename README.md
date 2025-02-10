<h2>Sandworm 3D printer - Klipper macros:</h2>
Author: Zachar Čuřík <br>
Launch date: Q2 2025 <br>
All code name: Sandworm Mach3 Y2025 GS556 (game_save_556) <br>
Branch: Urobotos codes <br>

<h3>The Sandworm printer uses a modified mainsail.cfg file called mainsail_custom.cfg: </h3>
(the redirected incude is included in the printer.cfg file, no need edit, it is listed here for information only)<br>
The modifications include:<br>

1. The fan (part cooling) turns off during PAUSE, and then resumes to its previous print speed during RESUME.<br>
Benefits: Fan will not spin unnecessarily during the pause, which can take longer with Filament Runout.<br>

2. The second added modification is the <b>point_unretract</b> macro, this is the last code sent when printing is RESUMED (after PAUSE). <br>
This is the coordinate point of the tool head on the print object when printing was paused and serves for <br>
a small filling of the nozzle directly at the point when continuation of printing.<br>
Benefit: No more empty layers on printed parts after a pause.

<h3>Copy and Paste Config Files: </h3>
Copy the entire contents of the Config folder (including subdirectories) with .cfg files here and paste them into your printer's config directory, <br> 
(choose yes when asked if you want to overwrite the printer.cfg file), to the a path that will look something like this:<br> 
home\biqu\printer_data\config\ <br><br>

Or you can clone this repository from the `printer_data/config` directory in the command line using the following command:<br>

```
git clone https://github.com/zacharcc/Sandworm.git
```

You can then restart the printer for the first <b>Sandworm</b> launch...<br>

<h3>Setup for remotely control printer power ON and OFF via Relay:</h3>
(The original code and setup instructions (from author Tinntbg) can be found at: https://github.com/tinntbg/auto-power-off-klipper ) <br>

For remote control power ON/OFF by Relay it is need add somewhere to <b>moonraker.conf</b> file codes below: <br>
```
[power printer]
type: gpio
pin: gpiochip0/gpio72              # can be revesed by "!" , BTT-PI GPIO pin PC8
initial_state: off
off_when_shutdown: True            # Turning off when a >shutdown/error occurs
locked_while_printing: True        # Preventing you from turning it off during a print
on_when_job_queued: True           # Toggling the power On when you send a file >from the slicer to print
restart_klipper_when_powered: True
restart_delay: 1
bound_service: klipper             # Making sure the Klipper service is started/restarted with the toggle
```

<h3>Filament Runout Sensor and Runout Distance macro:</h3>
<b>Description:</b> Adjustable distance delay (to run PAUSE) that is triggered when the filament sensor is activated to save filament, with a millimetres countdown to the end on the LCD display.<br>
<b>Distance</b> = Length of PTFE tube from filament runout switch to extruder gear.<br>
<b>Instructions:</b> Measure your PTFE tube length and enter value it into the <b>macros.cfg</b> file --> the <b>runout_distance</b> macro and its variable: <b>set distance = your_value_in_mm</b> . Subtract about 100mm from the measured length of PTFE tube to allow for manual removal of the filament from the extruder gear. The distance value is set to 930 by default. <br><br>

<b>In macros.cfg you will look for the exact macro and distance variable to set as in the example below: </b><br>
*(change the length value 930 to your current one, or leave 930 as default)*<br>
```
[gcode_macro runout_distance]
description: Filament Runout Distance
variable_distance_end: 0
gcode:
   {% set distance = 930 %}         ## <<<< ADJUSTABLE LENGTH of PTFE tube (in mm, from filament sensor to extruder gear).
   {% set start_point = printer.print_stats.filament_used | int %}
   {% set end_point = (start_point + distance) | int %}
   SET_GCODE_VARIABLE MACRO=runout_distance VARIABLE=distance_end VALUE={end_point}
   UPDATE_DELAYED_GCODE ID=runout_check DURATION=1
```

<h3> Language change:</h3>
Language translation is for the entire LCD menu and some macros.<br>
The current language version can be changed in the menu on the LCD display: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click on knob for Menu --> Setup --> Language --> Choice: English, Cestina or Deutch.<br><br>

<b>Or run one of the macros below: </b><br>
- <b>For English: </b><br>
```
  SET_MENU_LANGUAGE LANGUAGE=1
```
- <b>For Czech: </b><br>
```
  SET_MENU_LANGUAGE LANGUAGE=2
```
- <b>For Deutch </b><br>
```
  SET_MENU_LANGUAGE LANGUAGE=3
```

<h3>Mainsail and custom macro buttons:</h3>
(find the macro names below in the list of available macros and add them to the main page as buttons).<br>
(In Mainsail main page choose: Interface settings --> Macros --> Add group name).<br><br>

<b> Movement: (Group adjusted to: not displayed when pinting) </b><br>
- Temp_Homing <br>
- steppers_off <br>
- e_stepper_off <br>
- Park_Toolhead <br>

<b> Filament: (not displayed when pinting) </b><br>
- FILAMENT_LOAD <br>
- FILAMENT_UNLOAD <br>
- M600 <br>
- Nozzle_Clean  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # (via brush) <br>
- e_stepper_off <br>

<b> Chamber Lights (always on) </b><br>
- lights_ON_OFF  &nbsp;&nbsp; &nbsp;&nbsp; # (toggle button - Lights ON or OFF, its depends on previous Lights state) <br>
- lights_max     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;# (lights on maximum brithness) <br>

<b> Calibration: (not displayed when pinting and Pause) </b><br>
- Z_ENDSTOP_CALIBRATE_01 <br>
- PROBE_CALIBRATE_02 <br>
- Z_TILT_ADJUST_03 <br>
- BED_MESH_CALIBRATE_04 <br>

<b> Adjust print: (displayed only when pinting) </b><br>
- SET_PAUSE_AT_LAYER <br>
- SET_PAUSE_NEXT_LAYER <br>
- ACTIVATE_POWER_OFF <br>
- DEACTIVATE_POWER_OFF

<h3>PrusaSlicer - START and END gcodes: </h3>

In PrusaSlicer, insert these codes below into the Start gcodes and End gcodes sections:<br>

<b> START gcodes:</b>
```
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]
CLEAR_PAUSE
BED_MESH_CLEAR
start_gcode BED_TMP=[first_layer_bed_temperature] EXT_TMP=[first_layer_temperature] CHAMBER_TMP=[chamber_temperature] CHAMBER_MIN_TMP=[chamber_minimal_temperature]
```
<b> END gcodes:</b><br>
```
end_gcode
```

<b> CHAMBER_TMP and CHAMBER_MIN_TMP: </b>

<h3>Information about Proximity inductive probe SN-04 PNP and initial Z homing:</h3>
For the initial Z home (after starting the printer), it is recommended to preheat the nozzle, <br>
due to filament leakage from the Volcano nozzle after the previous print. <br>
Longer sticking filament does not cause much of a problem, it will bend on the SN-04 probe, <br>
but short and hard could cause a shock displacement of the probe. <br><br>

The probe detects the brass nozzle at a height of Z of approximately 0.6 - 0.7mm from the bed (when the edge <br>
of the probe is horizontally aligned with the PEI sheet), the nozzle is then approximately 1mm away from the probe <br>
itself (which has a recess in the middle). Different nozzle materials will affect the height of capture by the probe,<br> 
for example a carbide nozzle will be captured earlier (at a higher distance from the PEI sheet).<br>

<b>Solution:</b> There is no required to go to the printer and manually clean the nozzle, <br>
just preheat the nozzle remotely and start Z homing, after which the filament will <br>
remain bent and the next Z homing can be performed normally. <br>

<b> Buil-in macros: </b><br>
The Sandworm printer solves this situation with a built-in automatic G28 XYZ <b>Temp_Homing</b> macro, <br>
which preheats the nozzle (a little) and then performs XYZ homing. The macro is implemented in: <br>

- Start Gcodes <br>
- Noozle Clean (via brush, only when axis is not homed) <br>
- And in the last row, <b>Temp_Homing</b> will appear as a clickable macro in the Mainsail console every time the printer is started.

<h3>I also recommend the feature: Klipper Adaptive Meshing Purging (KAMP)</h3>
Great feature (from author Kyleisah) to Calibrate Bed Mesh only in the printed part area, to save time.<br>
https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging <br><br><br>


That's it, you've reached the end and your circle has closed. Thank you for your patience with the tutorials and for stay with them until the end. And remember, in the Urobotos lair, every ending is the beginning of a whole new journey... enjoy the printing!

![Urobotos Project](https://github.com/zacharcc/Sandworm/blob/urobotos/urobotos.gif)


































                                                           













































                                                             













                                                            














	  

