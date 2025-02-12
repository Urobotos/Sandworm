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

2. **Nozzle Priming After Pause**: The `<b>point_unretract</b>` macro is executed when printing resumes after a pause.<br>
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
pin: gpiochip0/gpio72   # Can be reversed with "!", BTT-PI GPIO pin PC8
initial_state: off
off_when_shutdown: True  # Turn off power on shutdown/error
locked_while_printing: True  # Prevent power-off during a print
on_when_job_queued: True  # Power on when a print job is sent
restart_klipper_when_powered: True
restart_delay: 1
bound_service: klipper  # Ensures Klipper service starts/restarts with power toggle
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
The LCD menu and some macros support multiple languages.<br>
To change the language:
1. **LCD Menu**: `Menu -> Setup -> Language -> Choose: English, Cestina, Deutsch`
2. **G-code Macros**:
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
  - `Nozzle_Clean` *(Uses brush, only if the axis is not homed)*
  - `e_stepper_off`

- **Chamber Lights (Always visible)**:
  - `lights_ON_OFF` *(Toggle ON/OFF based on previous state)*
  - `lights_max` *(Set lights to max brightness)*

- **Calibration (Hidden during prints & pauses)**:
  - `Z_ENDSTOP_CALIBRATE_01`
  - `PROBE_CALIBRATE_02`
  - `Z_TILT_ADJUST_03`
  - `BED_MESH_CALIBRATE_04`

### 🛠️ Klipper Adaptive Meshing Purging (KAMP)
A great feature by `Kyleisah` to calibrate only the printed area:
🔗 [Klipper Adaptive Meshing Purging](https://github.com/kyleisah/Klipper-Adaptive-Meshing-Purging)

### 🤝 Contributing
We welcome contributions! If you'd like to contribute, follow the [CONTRIBUTING.md](./CONTRIBUTING.md) guidelines. 🚀

---

That's it, you've reached the end! Thank you for your patience and for following the guide to the end. And remember, in the Urobotos lair, every ending is the beginning of a whole new journey... enjoy printing!

![Urobotos Project](images/Urobotos.gif)

