## Sandworm 3D Printer - Klipper Macros

```
Author: Zachar Čuřík
Launch Date: Q2 2025
Code Name: Sandworm Mach3 Y2025 GS556 (*game_save: "556") - (†game_over_date: "unknown")
Project by: Urobotos Coding
```
*(This project is part of **Urobotos** – a DIY initiative for Klipper-based 3D printing.)*

### The Sandworm printer uses a modified `mainsail.cfg` file called `mainsail_custom.cfg`:
(The redirected include is listed in `printer.cfg`, so no manual edits are needed. This is provided for information only.)<br>
Modifications include:<br>

1. **Fan Control**: The part cooling fan turns off during `PAUSE` and then resumes to its previous speed when `RESUME` is triggered.<br>
   - **Benefit**: The fan does not run unnecessarily during a pause, which can be extended when using a filament sensor for runout detection.<br>

2. **Nozzle Priming After Pause**: The `point_unretract` macro is executed when printing resumes after a pause.<br>
   - **How it works**: The print head returns to the paused position and performs a small filament extrusion to refill the nozzle.<br>
   - **Benefit**: Prevents gaps in the print caused by filament leakage during the pause.<br>

### 📂 Copy & Paste Config Files
- Copy all contents from the Sandworm GitHub folder (including subdirectories) and paste them into your printer’s config directory.
  - Example path: `home/biqu/printer_data/config/`
  - Choose **Yes** if prompted to overwrite `printer.cfg`.

- Alternatively, clone this repository directly from your `printer_data/config` directory using:
  ```
  git clone https://github.com/Urobotos/Sandworm.git
  ```
  - Restart your printer for the first **Sandworm** launch.<br>

### 🔌 Remote Power Control via Relay
The original setup guide (by `Tinntbg`) can be found at: [Auto Power Off Klipper](https://github.com/tinntbg/auto-power-off-klipper).<br>
To enable relay-based power control, add the following to your `moonraker.conf` file:<br>

```
[power printer]
type: gpio
pin: gpiochip0/gpio72               # Can be reversed with "!", BTT-PI GPIO pin PC8
initial_state: off
off_when_shutdown: True             # Turn off power on shutdown/error
locked_while_printing: True         # Prevent power-off during a print
restart_klipper_when_powered: True
restart_delay: 1
bound_service: klipper              # Ensures Klipper service starts/restarts with power toggle
```

### 🎞️ Filament Runout Sensor & `runout_distance` Macro
- **Description**: A configurable distance delay before `PAUSE` is triggered when the filament sensor is activated.
- **Purpose**: Saves filament by allowing extra material to be used before pausing.
- **Setup Instructions**:
  - Measure your PTFE tube length (from filament sensor to extruder gear).
  - In `macros.cfg`, find `runout_distance` and set `distance = your_value_in_mm`.
  - **Default value**: `930mm` (includes a ~100mm buffer for manual filament removal).

```ini
[gcode_macro runout_distance]
description: Filament Runout Distance
variable_distance_end: 0
gcode:
   {% set distance = 930 %}  # <<<< ADJUSTABLE LENGTH (in mm)
   {% set start_point = printer.print_stats.filament_used | int %}
   {% set end_point = (start_point + distance) | int %}
   SET_GCODE_VARIABLE MACRO=runout_distance VARIABLE=distance_end VALUE={end_point}
   UPDATE_DELAYED_GCODE ID=runout_check DURATION=1
```

### 🌐 Language Selection
The LCD menu and user-defined macros support multiple languages (not included in Klipper macros).<br>
To change the language:
1. **LCD Menu**: `Menu -> Setup -> Language -> Choose: English, Cestina, Deutsch`
2. **Or via G-code Macros**:
   - **English:**
     ```
     SET_MENU_LANGUAGE LANGUAGE=1
     ```
   - **Czech:**
     ```
     SET_MENU_LANGUAGE LANGUAGE=2
     ```
   - **German:**
     ```
     SET_MENU_LANGUAGE LANGUAGE=3
     ```

### 🖲️ Custom Macro Buttons in Mainsail
Find the macro names below and add them as buttons in **Mainsail**:

- **Movement (Hidden during prints)**:
  - `Temp_Homing`
  - `steppers_off`
  - `e_stepper_off`
  - `Park_Toolhead`

- **Filament (Hidden during prints)**:
  - `FILAMENT_LOAD`  *(Customizable temperature button, default: 200°C for PLA)*
  - `FILAMENT_UNLOAD` *(Customizable temperature button, default: 200°C for PLA)*
  - `M600`
  - `Nozzle_Clean` *(Uses brush)*
  - `e_stepper_off`

- **Chamber Lights (Always visible)**:
  - `lights_ON_OFF` *(Toggle ON/OFF based on previous state)*
  - `lights_max` *(Set lights to max brightness)*

- **Calibration (Hidden during prints & pauses)**:
  - `Z_ENDSTOP_CALIBRATE_01`
  - `PROBE_CALIBRATE_02`
  - `Z_TILT_ADJUST_03`
  - `BED_MESH_CALIBRATE_04`

### PrusaSlicer - START and END Gcodes
In **PrusaSlicer**, insert the following G-code snippets into the `Start G-codes` and `End G-codes` sections:

#### **🟢 Start G-codes:**
```gcode
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]
CLEAR_PAUSE
BED_MESH_CLEAR
start_gcode BED_TMP=[first_layer_bed_temperature] EXT_TMP=[first_layer_temperature] CHAMBER_TMP=[chamber_temperature] CHAMBER_MIN_TMP=[chamber_minimal_temperature]
```

#### **🔴 End G-codes:**
```gcode
end_gcode
```

#### **📌 About CHAMBER_TMP and CHAMBER_MIN_TMP Parameters**
These two parameters are set via **PrusaSlicer**:
- **`CHAMBER_TMP`** → Sets the automatic chamber temperature at which the **Cooling/Filtration Exhaust fans** activate (useful for heat-sensitive filaments like PLA).
- **`CHAMBER_MIN_TMP`** → Ensures the chamber temperature is above a minimum threshold before starting the print. If the temperature is too low, the printer **pauses** and uses the **heated bed at 100°C** to warm the chamber until it reaches the required value (especially useful for filaments prone to warping, such as ABS, PETG, etc.).

#### **📍 Where to Find These Parameters in PrusaSlicer:**
- **For automatic Cooling/Filtration:** `Filament Profile → Temperature → Chamber → Nominal: YOUR_VALUE °C`
- **To Preheat the Chamber Before Printing:** `Filament Profile → Temperature → Chamber → Minimum: YOUR_VALUE °C`

💡 **Tip:** You can set different values for different filaments or completely disable temperature automation for a specific filament.

- (**Note:** Always set the **minimum chamber temperature** with respect to ambient conditions. The macro relies on `TEMPERATURE_WAIT` (similar to `M109` for 
the hotend), meaning the printer **pauses all commands** during this phase. If needed, you can cancel the wait loop early by using an **Emergency Stop** and restarting the print with a 
different chamber temperature setting).

**Example Chamber Temperatures on Sandworm printer (after ~1 hour of printing):**
- Bed: 60°C | Ambient: 25°C | Chamber: 41°C
- Bed: 95°C | Ambient: 20°C | Chamber: 46°C
- Bed: 50°C | Ambient: 12°C | Chamber: 28°C


### **📡 Proximity Inductive Probe SN-04 PNP and Initial Z Homing**
For accurate **Z homing**, it's recommended to **preheat the nozzle** to prevent residual filament from interfering with the probe. 

#### **Why Preheat the Nozzle?**
- Especially after printing is complete, during nozzle cooling, **some filament may leak out** and solidify at the tip of the nozzle. If this filament remains after cooling, it can interfere with homing.
- **Longer filament strands** may bend harmlessly when contacting the **SN-04 probe**, but **short and hardened pieces** could lead to inaccurate measurements or even slight displacement of the probe itself.
- The **SN-04 inductive probe detects the brass nozzle** at **Z ≈ 0.6 - 0.7mm from the bed**, provided the probe is **aligned with the PEI sheet**. The nozzle itself remains **≈1mm away from the probe sensor**, which has a recessed detection point.
- **Different nozzle materials** (e.g., **carbide nozzles**) may cause the probe to trigger at slightly different heights **due to variations in electromagnetic properties**, meaning detection may occur **earlier, at a greater distance from the PEI sheet**.

#### **🚀 Solution: Automatic Nozzle Preheating**
Instead of requiring manual cleaning of the nozzle, the **Sandworm printer automates this process**. The recommended solution is to **preheat the nozzle remotely before initiating Z homing**. This softens any residual filament, allowing it to deform harmlessly when making contact with the probe, ensuring accurate homing.

#### **How Does It Work?**
1. The **nozzle is gently preheated** to a low temperature (e.g., **100°C**) before homing.
2. Any residual filament **bends** rather than obstructing the probe.
3. The nozzle **immediately cools** after homing, keeping the filament in its deformed shape for future homing cycles.
4. Subsequent homing operations can proceed normally, even with residual filament.

#### **🛠️ Built-in Macros for Z Homing**
The **Sandworm printer** includes an automatic `Temp_Homing` macro that:
1. **Preheats the nozzle slightly** before performing XYZ homing.
2. **Prevents filament from interfering with the probe.**
3. **Is integrated into multiple processes:**
   - **Start G-codes** (before every print)
   - **Nozzle Cleaning** (via brush, only when the axis is not homed)
   - **As a clickable macro (`Temp_Homing`) in the Mainsail console every time the printer starts**

<hr>

### Others:

### 🛠️ Klipper Adaptive Meshing Purging (KAMP)
A great feature by `Kyleisah` to calibrate only the printed area:
🔗 [Klipper Adaptive Meshing Purging](https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging)

### 🤝 Contributing
We welcome contributions! If you'd like to contribute, follow the [CONTRIBUTING.md](./CONTRIBUTING.md) guidelines. 🚀

---
<br>

✌️ That's it, your journey has come to an end! Thank you for your patience and for following the guide up to this point. And remember, in the Urobotos lair, every ending is the beginning of a whole new journey... enjoy printing, the game has begun!

![Urobotos Project](images/Urobotos.gif)


