
### Jump Navigation:

- 📜 [macros.cfg](#macroscfg)
- 💡 [lights_chamber.cfg](#lights_chambercfg)
- 🖥️ [display.cfg](#displaycfg)
- 🌪️ [fans.cfg](#fanscfg)
- ⚙️ [mainsail_custom.cfg](#mainsail_customcfg)
- 🚦 [start_end_gcodes.cfg](#start_end_gcodescfg)

	
### 📜 macros.cfg:

  - **[delayed_gcode strartup_message]** <br> 
    *For Mainsail console message (Temp_Homing) on Printer startup.*

  - **[delayed_gcode lcd_message]** <br> 
    *LCD message on printer startup.*
	
  - **[Z_ENDSTOP_CALIBRATE_01]** <br>
    *Z Endstop Calibrate for Mainsail macro button.*
	
  - **[PROBE_CALIBRATE_02]** <br>
    *Probe Calibrate for Mainsail macro button.*

  - **[Z_TILT_ADJUST_03]** <br>
    *Z Tilt Adjust for Mainsail macro button.*

  - **[BED_MESH_CALIBRATE_04]** <br>
    *Bed Mesh Calibrate for Mainsail macro button.*

  - **[Temp_Homing]** <br>
    *Homing with pre-heated nozzle.*
  
  - **[runout_distance]** and **[delayed_gcode runout_check]** <br>
    *Filament Runout Distance.* 
  
  - **[M600]** <br> 
    *Filament Change.*
  
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
    *Turns off steppers, heaters etc. after 8 minutes of inactivity.*

  - **[clear_display]** <br> 
    *Empty M117 message for auto-clear LCD display, with 25sec delay.*
	
  - **[ACTIVATE_POWER_OFF]**, **[DEACTIVATE_POWER_OFF]**, **[POWER_OFF_PRINTER_CHECK_ACT]** and **[_POWER_OFF_PRINTER]** <br>
    *To turn OFF the printer at the end of printing.*

    
### 💡 lights_chamber.cfg:

  - **[delayed_gcode set_lights_onstartup]** <br>
    *Restores saved lights settings on printer start / restart.*

  - **[restore_lights]** <br>
    *For setting a LOW value between LED flashes.*

  - **[set_onoff_lights]**                                      
    *ON/OF toggle lights for LCD menu.*
	
  - **[set_bright_lights]**                     
    *LCD Menu brightness Lights skript.*

  - **[set_rgb_lights]** <br>
    *Set R, G and B values to <lights_var> variable.*

  - **[lights_off]**  <br>
    *Lights OFF.*
	
  - **[lights_on]** <br>
    *Lights ON.*
	
  - **[lights_ON_OFF]**                                    
    *Lights ON/OFF for toggle button.
	
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

  - **[gcode_macro lights_on_50_percent]** <br>
    *Lights on 50% (example).*


### 🖥️ display.cfg:

  - **[M300]** <br>
    *M300 gcode for LCD Beeper.*
	
  - **[gcode_macro alert_beep]** <br>
    *Macro tone for alert beep.*

  - **[SET_MENU_LANGUAGE]** <br>
    *To change the language using the LCD menu*.

  - **[knob_feedback]** and **[delayed_gcode knob_return]** <br>
    *Knob LED feedback: ON-OFF.*


### 🌪️ fans.cfg:                                         
  - **[M141]** <br>
    *Target chamber temperature for automatic Cooling/Filtering.*

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

