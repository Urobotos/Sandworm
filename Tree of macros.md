
Navigation:

macros.cfg
lights_chamber.cfg
display.cfg
fans.cfg
mainsail_custom.cfg
start_end_gcodes.cfg



------------

macros.cfg

lights_chamber.cfg

display.cfg

fans.cfg

mainsail_custom.cfg

start_end_gcodes.cfg


----------------------

### macros.cfg:
  - **[delayed_gcode strartup_message]** <br> 
    description: Mesasage (Temp_Homing) on Printer startup.
	
  - **[Z_ENDSTOP_CALIBRATE_01]** <br>
    description: Z Endstop Calibrate macro button.
	
  - **[PROBE_CALIBRATE_02]** <br>
    description: Probe Calibrate macro button.

  - **[Z_TILT_ADJUST_03]** <br>
    description: Z Tilt Adjust macro button.

  - **[BED_MESH_CALIBRATE_04]** <br>
    description: Bed Mesh Calibrate macro button.

  - **[Temp_Homing]** <br>
    description: Homing with pre-heated nozzle.
  
  - **[runout_distance]** and **[delayed_gcode runout_check]** <br>
    description: Filament Runout Distance. 
  
  - **[M600]** <br> 
    description: Filament Change.
  
  - **[FILAMENT_LOAD]** <br>
    description: Filament Load 100mm.
  
  - **[FILAMENT_UNLOAD]** <br>
    description: Filament Unload 100mm.
  
  - **[Nozzle_Clean]** <br>
    description: Wipe nozzle by brush. 
  
  - **[FAKE_POSITION]** <br>
    description: Set Fake position: X100 Y100 Z100.
	
  - **[steppers_off]** <br>
    description: All steppers OFF.
  
  - **[e_stepper_off]** <br>
    description: E Stepper Off. 
  
  - **[Park_Toolhead]** <br>
    description: Park Toolhead.

  - **[idle_timeout]** <br>
    description: Turns off steppers etc. after 8 minutes of inactivity.

  - **[clear_display]** <br> 
    description: Empty M117 message for auto-clear LCD display, with 25sec delay.
	
  - **[ACTIVATE_POWER_OFF]**, **[DEACTIVATE_POWER_OFF]**, **[POWER_OFF_PRINTER_CHECK_ACT]** and **[_POWER_OFF_PRINTER]** <br>
    description: For Printer remote control power ON/OFF by Relay.

  - **[Bed_Lowrider]** <br>
    description: Bed Joint Bearing test moves


### lights_chamber.cfg:
  - **[lights_var]** <br>
    description: lights Variables.

  - **[delayed_gcode set_lights_onstartup]** <br>
    description: Restores saved lights settings on printer start / restart. 

  - **[restore_lights]** <br>
    description: As a LOW value between LED flashes. ###### Je zde v popisu čeština ODSTRANIT!!!!

  - **[set_onoff_lights]**                                      
    description: ON/OF toogle lights for LCD menu.
	
  - **[set_bright_lights]**                     
    description: LCD Menu brightness Lights skript.

  - **[set_rgb_lights]** <br>
    description: Set R, G and B values to <lights_var> variable.

  - **[lights_off]**  <br>
    description: Lights Off.
	
  - **[lights_on]** <br>
    description: Lights ON.
	
  - **[lights_ON_OFF]**                                    
    description: Lights ON/OFF for Mainsail toogle button.
	
  - **[lights_max]** <br>
    description: lights on Maximum.
	
  - **[Green_Blink]** <br>
    description: Green Blink.
	
  - **[Red_Blink]** <br> 
    description: Red Blink.
	
  - **[Blue_Blink]** <br>
    description: Blue Blink.	

  - **[blue]** <br>
    description: lights blue (example).

  - **[pink]** <br>
    description: lights pink (example).


### display.cfg:
  - **[M300]** <br>
    description: LCD Beeper.
	
  - **[play_tone]** <br>
    description: LCD Beeper.

  - **[SET_MENU_LANGUAGE]** <br>
    description: LCD menu language.

  - **[knob_feedback]**, **[delayed_gcode knob_feedback_return]** and **[delayed_gcode knob_on_reboot]** <br>
    description: Knob LED feedback.


### fans.cfg:                                         
  - **[M141]** <br>
    description: Macro for set automatic chamber cooling / filtering temperature. ##(ZDE předělat popisy maker, dle readme.md!!!)

  - **[M191]** <br>
    description: Wait until the chamber has warmed up to the minimum temperature.
	

### mainsail_custom.cfg:
  - **[point_unretract]** <br>
    description: The final mini fill nozzle when toolhead is back to the print pause point.

  - #### Defined macros by Mainsail:
    - **[_CLIENT_VARIABLE]** <br>
	  description: List of user-defined variables.
	  
    - **[CANCEL_PRINT]** <br>
      description: Cancel the actual running print.
	  
    - **[PAUSE]** <br>
      description: Pause the actual running print.
	  
    - **[RESUME]** <br>
      description: Resume the actual running print.
	  
    - **[SET_PAUSE_NEXT_LAYER]** <br>
      description: Enable a pause if the next layer is reached.
	  
    - **[SET_PAUSE_AT_LAYER]** <br>
      description: Enable/disable a pause if a given layer number is reached.
	  
    - **[SET_PRINT_STATS_INFO]** <br>

    - **[_TOOLHEAD_PARK_PAUSE_CANCEL]** <br>
      description: Helper: park toolhead used in PAUSE and CANCEL_PRINT.

    - **[_CLIENT_EXTRUDE]** <br>
      description: Extrudes, if the extruder is hot enough.

    - **[_CLIENT_RETRACT]** <br>
      description: Retracts, if the extruder is hot enough.

    - **[_CLIENT_LINEAR_MOVE]** <br>
      description: Linear move with save and restore of the gcode state.


### start_end_gcodes.cfg:
  - **[start_gcode]** <br>
  - **[end_gcode]** <br>

