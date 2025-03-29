
### Jump Navigation:

- 📜 [macros.cfg](#-macroscfg)
- 💡 [lights_chamber.cfg](#-lights_chambercfg)
- 🖥️ [display.cfg](#-displaycfg)
- 🌪️ [fans.cfg](#-fanscfg)
- ⚙️ [mainsail_custom.cfg](#%EF%B8%8F-mainsail_customcfg)
- 🚦 [start_end_gcodes.cfg](#-start_end_gcodescfg)

	
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
    (Display, Chymber lights, Extruder LEDs) *Restores saved lights settings on printer start / restart.*

  - **[gcode_macro SET_LED]** <br>
    *SET_LED rename - For real-time synchronization of RGB(W) lighting state across multiple control interfaces.*

  - **[gcode_macro SET_LED_BLINK]** <br>
    *Makro helper for Led blinks.*   

  - **[lights_on]** <br>
    *Chamber Lights ON*

  - **[lights_off]**  <br>
    *Chamber Lights OFF*
	
  - **[lights_max]** <br>
    *Chamber lights on Maximum.*
	
  - **[lights_ON_OFF]** <br>                                   
    *Chamber Lights ON/OFF (Toggle macro button).*
		
  - **[gcode_macro nozzle_led_on]** <br>
    *Extruder LED ON.*
	
  - **[gcode_macro nozzle_led_off]** <br> 
    *Extruder LED OFF.*
	
  - **[gcode_macro Extruder_LED_ON_OFF]** <br>
    *Extruder LED ON/OFF (Toggle macro button).*	

  - **[gcode_macro display_on]** <br>
    *Display LED ON.*

  - **[gcode_macro display_off]** <br>
    *Display LED OFF.*

  - **[gcode_macro Display_LED_ON_OFF] ** <br>
    *isplay LED ON/OFF (Toggle macro button).*


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

