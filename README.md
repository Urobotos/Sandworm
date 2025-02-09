##########################################################
#                  Sandworm 3D printer                   #
#                    Klipper macros:                     #
##########################################################

##########################################################
#  Basic information, for get started:                   #
##########################################################
When marking and distinguishing variables from regular text, I use <> brackets; always enter values ​​into code macros without <> brackets.
For example, for a note in the text: 
             Change <value> to your length in mm in the distance variable below:   # And your lenght value will be for example 930 mm
             {% set distance = <value> %}                                          # Original code with <> brackets
             {% set distance = 930 %}                                              # Modified code after changing to the yours length (without <> brackets)

# In macros I use my modified mainsail.cfg file called mainsail_custom.cfg 
(the redirected incude is included in the printer.cfg file, no need edit)
The modifications include:

1. The fan (part cooling) turns off during PAUSE, and then resumes to its previous print speed during RESUME.
Benefits: Fan will not spin unnecessarily during the pause, which can take longer with Filament Runout.

2. The second added modification is the <point_unretract> macro, this is the last code sent when printing is RESUMED (after PAUSE). 
This is the coordinate point of the tool head on the print object when printing was paused and serves for 
a small filling of the nozzle directly at the point when continuation of printing.
Benefit: No more empty layers on printed parts after a pause.
					  
##########################################################
#  PrusaSlicer START and END gcodes:                     #
##########################################################
In PrusaSlicer, insert these codes below into the Start gcodes and End gcodes sections:

# Start gcodes:
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]
CLEAR_PAUSE 
BED_MESH_CLEAR
start_gcode BED_TMP=[first_layer_bed_temperature] EXT_TMP=[first_layer_temperature] CHAMBER_TMP=[chamber_temperature] CHAMBER_MIN_TMP=[chamber_minimal_temperature]

# End gcodes:
end_gcode

##########################################################
#  Mainsail and macro Buttons:                           #
##########################################################
(find the macro names below in the list of available macros and add them to the main page as buttons).
(In Mainsail main page choose: Interface settings --> <> Macros --> Add Group).

# Movement: (adjusted to: not displayed when pinting)
Temp_homong
E Stepper off
Park_toolhaead

# Filament: (not displayed when pinting, only on Pause and Printer Ready state)
Filament load
Filament unload
M600
Noozle Clean (via brush)
E stepper off

# Chamber Lights (always on)
Lights on off (toogle button)
Lights max (lights on maximum brithness)

# Calibration: (not displayed when pinting and Pause)
Z Endstop calibrate 01
Probe calibrate 02
Z tilt adjust 03
Bed mesh calibrate 04

# Adjust print: (displayed only when pinting)
set pause at layer
set pause next layer
Activate power off
Deactivate power off

##########################################################
#  Information about Proximity inductive probe SN-04 PNP #
#                 and initial Z homing                   #
##########################################################
For the initial Z home (after starting the printer), it is recommended to preheat the nozzle, 
due to filament leakage from the Volcano nozzle after the previous print. 
Longer sticking filament does not cause much of a problem, it will bend on the SN-04 probe, 
but short and hard could cause a shock displacement of the probe.

Solution: It is not required to go to the printer to manually clean the nozzle, 
just preheat the nozzle remotely and start Z homing, after which the filament will 
remain bent and the next Z homing can be performed normally.

# Buil-in macros: 
The printer handles this situation with a built-in automatic G28 XYZ macro <Temp_Homing>, 
which preheats the nozzle (a little) and then performs Z homing. The macro is implemented in:

- Start Gcodes
- Noozle Clean (via brush, only when axis is not homed)
- And in the last row, <Temp_Homing> will appear as a clickable macro in the Mainsail console every time the printer is started.

##########################################################
#  Language change                                       #
##########################################################
The current language version can be changed in the menu on the LCD display: 
Click on knob for Menu --> Setup --> Language --> and choice:

English, Cestina or Deutch

or run macro:
# For English:
SET_MENU_LANGUAGE LANGUAGE=1
# For Czech:
SET_MENU_LANGUAGE LANGUAGE=2
# For Deutch
SET_MENU_LANGUAGE LANGUAGE=3


##########################################################
# Manual for remotely control printer power ON and OFF via Relay:
(The original code and setup instructions can be found at: https://github.com/tinntbg/auto-power-off-klipper )

For remote control power ON/OFF by Relay it is need add somewhere to moonraker.conf file codes below:

[power printer]
type: gpio
pin: gpiochip0/gpio72               # can be revesed by "!" , BTT-PI GPIO pin PC8
initial_state: off  
off_when_shutdown: True             # Turning off when a shutdown/error occurs
locked_while_printing: True         # Preventing you from turning it off during a print
on_when_job_queued: True            # Toggling the power On when you send a file from the slicer to print
restart_klipper_when_powered: True
restart_delay: 1
bound_service: klipper              # Making sure the Klipper service is started/restarted with the toggle


##########################################################
Niní máte vše připravené, 

home\biqu\printer_data\config\


