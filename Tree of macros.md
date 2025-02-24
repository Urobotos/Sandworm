
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
  - [delayed_gcode strartup_message]  
    description: Mesasage (Temp_Homing) on Printer startup.
	
  - [Z_ENDSTOP_CALIBRATE_01]
    description: Z Endstop Calibrate macro button.
	
  - [PROBE_CALIBRATE_02]
    description: Probe Calibrate macro button.

  - [Z_TILT_ADJUST_03]
    description: Z Tilt Adjust macro button.

  - [BED_MESH_CALIBRATE_04]
    description: Bed Mesh Calibrate macro button.

  - [Temp_Homing]
    description: Homing with pre-heated nozzle.
  
  - [runout_distance] and [delayed_gcode runout_check]
    description: Filament Runout Distance. 
  
  - [M600] 
    description: Filament Change.
  
  - [FILAMENT_LOAD]
    description: Filament Load 100mm.
  
  - [FILAMENT_UNLOAD]
    description: Filament Unload 100mm.
  
  - [Nozzle_Clean]
    description: Wipe nozzle by brush. 
  
  - [FAKE_POSITION]
    description: Set Fake position: X100 Y100 Z100.
	
  - [steppers_off]
    description: All steppers OFF.
  
  - [e_stepper_off]
    description: E Stepper Off. 
  
  - [Park_Toolhead]
    description: Park Toolhead.

  - [idle_timeout]
    description: Turns off steppers etc. after 8 minutes of inactivity.

  - [clear_display] 
    description: Empty M117 message for auto-clear LCD display, with 25sec delay.
	
  - [ACTIVATE_POWER_OFF], [DEACTIVATE_POWER_OFF], [POWER_OFF_PRINTER_CHECK_ACT] and [_POWER_OFF_PRINTER]
    description: For Printer remote control power ON/OFF by Relay.

  - [Bed_Lowrider]
    description: Bed Joint Bearing test moves


### lights_chamber.cfg:
  - [lights_var]
    description: lights Variables.

  - [delayed_gcode set_lights_onstartup]
    description: Restores saved lights settings on printer start / restart. 

  - [restore_lights]                      ###### Je zde v popisu čeština ODSTRANIT!!!!
    description: As a LOW value between LED flashes.

  - [set_onoff_lights]                                        
    description: ON/OF toogle lights for LCD menu.
	
  - [set_bright_lights]                      
    description: LCD Menu brightness Lights skript.
	
  - [set_rgb_lights]
    description: Set R, G and B values to <lights_var> variable.
	
  - [lights_off]
    description: Lights Off.
	
  - [lights_on]
    description: Lights ON.
	
  - [lights_ON_OFF]                                        
    description: Lights ON/OFF for Mainsail toogle button.
	
  - [lights_max] # lights na MAX
    description: lights on Maximum.
	
  - [Green_Blink]
    description: Green Blink.
	
  - [Red_Blink] 
    description: Red Blink.
	
  - [Blue_Blink] 
    description: Blue Blink.	

  - [blue]
    description: lights blue (example).

  - [pink]
    description: lights pink (example).


### display.cfg:
  - [M300]
    description: LCD Beeper.
	
  - [play_tone]
    description: LCD Beeper.

  - [SET_MENU_LANGUAGE]
    description: LCD menu language.

  - [knob_feedback], [delayed_gcode knob_feedback_return] and [delayed_gcode knob_on_reboot]
    description: Knob LED feedback.


### fans.cfg:                                         ##(ZDE předělat popisy maker, dle readme.md!!!)
  - [M141]
    description: Macro for set automatic chamber cooling / filtering temperature.

  - [M191]
    description: Wait until the chamber has warmed up to the minimum temperature.
	

### mainsail_custom.cfg:
  - [point_unretract]
    description: The final mini fill nozzle when toolhead is back to the print pause point.

  - #### Defined macros by Mainsail:
    - [_CLIENT_VARIABLE]
	  description: List of user-defined variables.
	  
    - [CANCEL_PRINT]
      description: Cancel the actual running print.
	  
    - [PAUSE]
      description: Pause the actual running print.
	  
    - [RESUME]
      description: Resume the actual running print.
	  
    - [SET_PAUSE_NEXT_LAYER]
      description: Enable a pause if the next layer is reached.
	  
    - [SET_PAUSE_AT_LAYER]
      description: Enable/disable a pause if a given layer number is reached.
	  
    - [SET_PRINT_STATS_INFO]

    - [_TOOLHEAD_PARK_PAUSE_CANCEL]
      description: Helper: park toolhead used in PAUSE and CANCEL_PRINT.

    - [_CLIENT_EXTRUDE]
      description: Extrudes, if the extruder is hot enough.

    - [_CLIENT_RETRACT]
      description: Retracts, if the extruder is hot enough.

    - [_CLIENT_LINEAR_MOVE]
      description: Linear move with save and restore of the gcode state.


### start_end_gcodes.cfg:
  - [start_gcode]
  - [end_gcode]

