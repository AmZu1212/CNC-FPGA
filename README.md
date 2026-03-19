![Top Banner](https://github.com/user-attachments/assets/7fda2d74-d90f-4a15-a4f0-2e73835bf580)
# CNC-FPGA

**Authors:** Amir Zuabi, Alexey Vassiliev
**Project Instructor:** Oz Shmueli

**Tech Stack:** Verilog HDL, Embedded C, AMD Vitis + Vivado 2024.2

FPGA-driven CNC / pen-plotter control system built around the AMD/Xilinx Zynq-7000
ZedBoard. The machine uses a ballpoint pen as its toolhead and draws 2D paths on
paper by coordinating X/Y motion and pen lift on the Z axis.

The project combines:

- real-time motion control in programmable logic
- SD-card file execution from embedded C software
- a custom PS/PL handshake for streaming toolpath data
- synchronized X/Y/Z stepping and homing behavior

<img src="https://github.com/user-attachments/assets/36d3c2b8-df92-4526-b27e-2ac13546e288" alt="Machine photo" width="600">

---

## Gallery

### The Finished Machine

<img src="https://github.com/user-attachments/assets/d03e49cb-4d8f-49c4-ba88-ef827f9c7279" alt="Machine photo" width="600">

### PCB / Electronics

<img src="https://github.com/user-attachments/assets/8159b595-367a-40c8-8b42-88b922629bd5" alt="Unsoldered PCB" width="300"><img src="https://github.com/user-attachments/assets/9ce17300-c851-4805-a044-b256336c854e" alt="Unsoldered PCB" width="300">

### The Zedboard (Board Platform with PS/PL)

<img src="https://github.com/user-attachments/assets/6a2135af-0862-4bad-b2f2-593dc473438e" alt="Machine photo" width="600">

### System Overview

<img width="600" alt="system overview" src="https://github.com/user-attachments/assets/c89f4c1b-e395-49c2-884e-f2509f8f151a" />


### Demo Video

GitHub Markdown does not truly embed YouTube playback inline, but you can present it cleanly with a thumbnail link.

Replace the placeholders below when you have the final link:

```md
[![Watch the demo](path/to/video_thumbnail.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)
```

Or use a plain link:

```md
[Project Demo Video](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)
```

---

## What This Project Does

This project implements a complete CNC-style execution pipeline:

1. A `RUN.G` file is placed on an SD card
2. The Zynq PS mounts the SD card and reads the G-code
3. Embedded C software filters and converts supported motion commands
4. Motion data is written into AXI GPIO registers
5. The FPGA consumes commands and executes motion in hardware
6. The machine supports homing, start, cancel, return, and resumed runs

<img width="600" alt="machien workflow" src="https://github.com/user-attachments/assets/b1a509a9-09ef-4641-a544-a97cab1e2d93" />


This is done using:

- Verilog RTL
- Vivado block design integration
- AXI register interfaces
- Embedded C firmware
- Vitis deployment flow

---

## Why It Is Technically Interesting

This project required work across several domains:

- **Digital design**
  Custom Verilog modules for command handling, motion coordination, handshaking, and driver control.

- **Embedded systems**
  C firmware for SD card access, G-code parsing, register writes, modal state handling, and PS/PL synchronization.

- **System integration**
  Vivado block design, AXI GPIO mapping, platform export, Vitis application flow, FPGA programming, and serial debugging.

- **Motion control**
  Coordinated X/Y/Z movement, homing, safe Z raises, speed handling, cancellation, and return-to-home logic.

- **Debugging and validation**
  Timing-sensitive PS/PL handshakes, startup behavior, stale register hazards, parsing corner cases, and hardware execution issues.

---

## Architecture

### PL Responsibilities

The programmable logic is responsible for deterministic motion execution:

- parser-side command sequencing
- motion coordination across X/Y/Z
- speed / timing translation into step generation
- homing and return behavior
- interaction with external stepper control logic

Key RTL modules include:

- `GCODE_Parser`
- `XYZ_Axis_Coordinator`
- `DriverController`

### PS Responsibilities

The processing system is responsible for file-driven command preparation:

- mounting the SD card
- opening `RUN.G`
- filtering G-code to supported motion commands (only G0/G1 are currently supported)
- converting units into machine format
- writing payload and handshake values into registers

<img width="600" alt="pl ps responsibilities" src="https://github.com/user-attachments/assets/11a07f24-b9dc-4e98-9606-032798debb4d" />


---

## Supported G-code Behavior

The current software parser focuses on the motion subset needed for the machine workflow.

Supported behavior:

- accepts `G0` and `G1`
- ignores unsupported non-motion lines
- ignores comments
- preserves modal values for omitted `X`, `Y`, `Z`, and `F`
- converts:
    - `X/Y/Z`: mm -> microns
    - `F`: mm/min -> mm/s
- clamps motion values to the machine work area

Expected input file:

- SD card filename: `RUN.G`

---

## Repository Structure

- [`Zedboard-CNC/`](./Zedboard-CNC)
  Vivado hardware project, RTL, block design, and generated hardware artifacts.

- [`Vitis-Classic/`](./Vitis-Classic)
  Vitis Classic workspace and platform/application projects.

- [`Vitis3/`](./Vitis3)
  Vitis Classic workspace and platform/application projects. (the project is programmed to the board from here)

- [`Documentation/`](./Documentation)
  Sample G-code files, hex files, reference material, project assets, etc.

---

## How To Run

### Vivado

Use Vivado when you need to:

- inspect or edit the block design
- modify RTL
- regenerate the bitstream
- export hardware for Vitis (vitis needs an .xsa file, also, when exporting hardware, dont forget to include bitstream. without it yo ucannot program the PL side of things.)

### Vitis Classic

For normal use, the project should be launched directly from the existing Vitis Classic setup.

#### Step-by-step

1. Connect the board to the PC.
2. Connect the USB cable used for JTAG/programming.
3. Connect the USB cable used for UART/serial output.
4. Open the Vitis Classic workspace/project directory (Please note: open Vitis Classic, and not Vitis Unified).

<img width="600" alt="step1" src="https://github.com/user-attachments/assets/b2b0048d-760e-4615-b305-27fab7dc5f3c" />

6. Open the existing application project.
7. Make sure the board is powered.
8. Launch the application on hardware.(right click the project application, and press "launch on hardware")

<img width="600" alt="step2" src="https://github.com/user-attachments/assets/01fa42e6-dfd0-4dfa-b00f-7ca646f8e2a5" />

10. Open the serial terminal if you want runtime prints.

<img width="600" alt="com port prints" src="https://github.com/user-attachments/assets/5a779245-2032-49f0-8de0-2d31fbf907c7" />

For the normal checked-in working flow, no rebuild is required just to run the design if the workspace is already in a valid state.

### Serial Terminal

When using runtime prints:

- use the board UART COM port
- standard settings are typically:
    - `115200`
    - `8-N-1`
    - no flow control

---

## Wiring Guide

### Required Board Connections

- Zedboard power (i.e the included board power adapter)
- JTAG/programming USB
- UART USB
- SD card inserted (a micro-sd to SD adapter can be used and is recommended)

### Motion / Driver Wiring

<img width="600" alt="wiring" src="https://github.com/user-attachments/assets/a1596980-f181-4ed6-801f-4c5ce60ab138" />

The diagram above shows one complete motor assembly using the PMOD top `A`
cluster, an A4988 driver, a Nema 17 stepper motor, a limit switch, and a
12V-to-3.3V step-down supply. The same wiring pattern is reused for each axis.

Additional connections from the driver assembly:

- A4988 `2B`, `2A`, `1A`, `1B` connect to the Nema 17 motor phases.
- A4988 `VM` is powered from the `12V` supply.
- A4988 logic `VDD` is powered from the step-down `3.3V` output.
- All grounds must be common between the ZedBoard, step-down converter, driver, and power supply.
- A `100 uF` capacitor is placed across the motor supply near the A4988 driver.
- The PCB is designed for a `12V`, `3A` DC input supply.
- This can be provided either by a suitable wall power adapter or by a portable battery/power-bank setup, as used in this project, as long as it can reliably supply `12V` at `3A`.

The remaining PMOD clusters use the same signal order:

- PMOD `A`: X axis
- PMOD `B`: Z axis
- PMOD `C`: Y axis

The table below shows the shared signal order for all three PMOD motor clusters.

| Pin # | PMOD Pin Name | Signal Definition | A4988 / External Connection |
| ----- | ------------- | ----------------- | --------------------------- |
| `1` | `JA1 / JB1 / JC2_P` | `DIR` | A4988 `DIR` |
| `2` | `JA2 / JB2 / JC1_N` | `STEP` | A4988 `STEP` |
| `3` | `JA3 / JB3 / JC1_P` | `RST` | A4988 `RST` |
| `4` | `JA4 / JB4 / JC2_N` | `LSS` | Limit switch signal |
| `5` | `GND / GND / GND` | `LS-` | Limit switch return |
| `6` | `VCC / VCC / VCC` | `LS+` | Limit switch `V+` |
| `7` | `JA7 / JB7 / JC3_P` | `EN` | A4988 `EN` |
| `8` | `JA8 / JB8 / JC3_N` | `MS1` | A4988 `MS1` |
| `9` | `JA9 / JB9 / JC4_P` | `MS2` | A4988 `MS2` |
| `10` | `JA10 / JB10 / JC4_N` | `MS3` | A4988 `MS3` |
| `11` | `GND / GND / GND` | `GND` | A4988 `GND` / common ground |
| `12` | `VCC / VCC / VCC` | `SLP` | A4988 `SLP` / 3.3V logic rail |

### PS / PL Register Interface

The software and hardware communicate through AXI GPIO-backed registers.

The interface uses a small request/acknowledge handshake between the Processing
System (PS) and Programmable Logic (PL). The PL raises `MOUNT_REQ` when it wants
the PS to open and prepare a job. The PS answers with `MOUNT_OK` or `MOUNT_FAIL`.
After that, the PL requests the next motion entry by changing `REQ`. The PS writes
`X`, `Y`, `Z`, `SPEED`, and `LAST_LINE`, then updates `ACK` to the same phase only
after the data is ready. Matching `REQ` and `ACK` tells the PL that the next
motion command is valid and can be executed.

| Direction | Register Name | Purpose |
| --------- | ------------- | ------- |
| PS → PL | `X` | Next command X position written by the C application. |
| PS → PL | `Y` | Next command Y position written by the C application. |
| PS → PL | `Z` | Next command Z position written by the C application. |
| PS → PL | `SPEED` | Speed value associated with the current motion command. |
| PS → PL | `ACK` | Phase acknowledge register. Updated only after the new command data is valid. |
| PS → PL | `MOUNT_OK` | Indicates that the PS mounted the SD card and opened the job successfully. |
| PS → PL | `MOUNT_FAIL` | Indicates that the PS could not mount or open the requested job. |
| PS → PL | `LAST_LINE` | Marks that the currently served motion command is the final valid line in the file. |
| PL → PS | `REQ` | Phase request register used by the PL to ask for the next motion command. |
| PL → PS | `MOUNT_REQ` | Session request bit used by the PL to tell the PS to mount and prepare a file. |

---

## Typical Runtime Flow

1. PS detects a mount request from the PL
2. PS mounts the SD card and opens `RUN.G`
3. PS preloads the first valid motion command
4. PL acknowledges and advances through phase-based requests
5. PS serves one motion at a time through AXI registers
6. PL executes the path in hardware
7. On cancel, the machine performs a controlled return-to-home sequence

<img width="600" alt="machine flow" src="https://github.com/user-attachments/assets/593421ec-3dc2-4933-83fd-c1fe5225dd82" />


---

## Current Status

The system demonstrates a working end-to-end CNC control path:

- SD card file loading
- C-based G-code parsing and conversion
- PS/PL handshake and register streaming
- hardware motion execution
- homing, start, cancel, and restart behavior

This repository represents substantial work in:

- FPGA design
- embedded software
- control logic
- hardware/software integration
- debugging of real machine behavior

---

## Notes

- `RUN.G` is the expected job filename on the SD card
- some folders contain bring-up code and experiments in addition to the main working flow
- platform regeneration may be required when hardware-visible interfaces change

---

## Authors

A Project by Amir Zuabi & Alex Vassiliev
