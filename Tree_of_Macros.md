
### Jump Navigation:

- 📜 [macros.cfg](#macroscfg)
- 💡 [lights_chamber.cfg](#lights_chambercfg)
- 🖥️ [display.cfg](#displaycfg)
- 🌪️ [fans.cfg](#fanscfg)
- ⚙️ [mainsail_custom.cfg](#mainsail_customcfg)
- 🚦 [start_end_gcodes.cfg](#start_end_gcodescfg)

	
### 📜 macros.cfg:
  - **[delayed_gcode strartup_message]** <br> 
    *description: Mesasage (Temp_Homing) on Printer startup.*
	
  - **[Z_ENDSTOP_CALIBRATE_01]** <br>
    *Z Endstop Calibrate macro button.*
	
  - **[PROBE_CALIBRATE_02]** <br>
    *Probe Calibrate macro button.*

  - **[Z_TILT_ADJUST_03]** <br>
    *Z Tilt Adjust macro button.*

  - **[BED_MESH_CALIBRATE_04]** <br>
    *Bed Mesh Calibrate macro button.*

  - **[Temp_Homing]** <br>
    *Homing with pre-heated nozzle.*
  
  - **[runout_distance]** and **[delayed_gcode runout_check]** <br>
    *Filament Runout Distance.* 
  
  - **[M600]** <br> 
    *description: Filament Change.*
  
  - **[FILAMENT_LOAD]** <br>
    *Filament Load 100mm.*
  
  - **[FILAMENT_UNLOAD]** <br>
    *Filament Unload 100mm.*
  
  - **[Nozzle_Clean]** <br>
    *Wipe nozzle by brush.* 
  
  - **[FAKE_POSITION]** <br>
    *Set Fake position: X100 Y100 Z100.*
	
  - **[steppers_off]** <br>
    *All steppers OFF.*
  
  - **[e_stepper_off]** <br>
    *E Stepper OFF.*
  
  - **[Park_Toolhead]** <br>
    *Park Toolhead.*

  - **[idle_timeout]** <br>
    *Turns off steppers etc. after 8 minutes of inactivity.*

  - **[clear_display]** <br> 
    *Empty M117 message for auto-clear LCD display, with 25sec delay.*
	
  - **[ACTIVATE_POWER_OFF]**, **[DEACTIVATE_POWER_OFF]**, **[POWER_OFF_PRINTER_CHECK_ACT]** and **[_POWER_OFF_PRINTER]** <br>
    *For Printer remote control power ON/OFF by Relay.*

  - **[Bed_Lowrider]** <br>
    *Bed joint bearing test moves.*
    

### 💡 lights_chamber.cfg:
  - **[lights_var]** <br>
    *lights Variables.*

  - **[delayed_gcode set_lights_onstartup]** <br>
    *Restores saved lights settings on printer start / restart.*

  - **[restore_lights]** <br>
    *As a LOW value between LED flashes. ###### Je zde v popisu čeština ODSTRANIT!!!!*

  - **[set_onoff_lights]**                                      
    *ON/OF toogle lights for LCD menu.*
	
  - **[set_bright_lights]**                     
    *LCD Menu brightness Lights skript.*

  - **[set_rgb_lights]** <br>
    *Set R, G and B values to <lights_var> variable.*

  - **[lights_off]**  <br>
    *Lights OFF.*
	
  - **[lights_on]** <br>
    *Lights ON.*
	
  - **[lights_ON_OFF]**                                    
    *Lights ON/OFF for Mainsail toogle button.
	
  - **[lights_max]** <br>
    *lights on Maximum.*
	
  - **[Green_Blink]** <br>
    *Green Blink.*
	
  - **[Red_Blink]** <br> 
    *Red Blink.*
	
  - **[Blue_Blink]** <br>
    *Blue Blink.*	

  - **[blue]** <br>
    *lights blue (example).*

  - **[pink]** <br>
    *lights pink (example).*


### 🖥️ display.cfg:
  - **[M300]** <br>
    *LCD Beeper.*
	
  - **[play_tone]** <br>
    *LCD Beeper.*

  - **[SET_MENU_LANGUAGE]** <br>
    *LCD menu language*.

  - **[knob_feedback]**, **[delayed_gcode knob_feedback_return]** and **[delayed_gcode knob_on_reboot]** <br>
    *Knob LED feedback.*


### 🌪️ fans.cfg:                                         
  - **[M141]** <br>
    *Macro for set automatic chamber cooling / filtering temperature.*

  - **[M191]** <br>
    *Wait until the chamber has warmed up to the minimum temperature.*
	

### ⚙️ mainsail_custom.cfg:
  - **[point_unretract]** <br>
    *The final mini fill nozzle when toolhead is back to the print pause point.*

  - #### Defined macros by Mainsail:
    - **[_CLIENT_VARIABLE]** <br>
      *List of user-defined variables.*
	  
    - **[CANCEL_PRINT]** <br>
      *Cancel the actual running print.*
	  
    - **[PAUSE]** <br>
      *Pause the actual running print.*
	  
    - **[RESUME]** <br>
      Resume the actual running print.*
	  
    - **[SET_PAUSE_NEXT_LAYER]** <br>
      *Enable a pause if the next layer is reached.*
	  
    - **[SET_PAUSE_AT_LAYER]** <br>
      *Enable/disable a pause if a given layer number is reached.*
	  
    - **[SET_PRINT_STATS_INFO]** <br>

    - **[_TOOLHEAD_PARK_PAUSE_CANCEL]** <br>
      *Helper: park toolhead used in PAUSE and CANCEL_PRINT.*

    - **[_CLIENT_EXTRUDE]** <br>
      *Extrudes, if the extruder is hot enough.*

    - **[_CLIENT_RETRACT]** <br>
      *Retracts, if the extruder is hot enough.*

    - **[_CLIENT_LINEAR_MOVE]** <br>
      *Linear move with save and restore of the gcode state.*


### 🚦 start_end_gcodes.cfg:
  - **[start_gcode]** <br>
  - **[end_gcode]** <br>

