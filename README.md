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

This is not just motor stepping from software. It is a hardware/software control stack with:

- Verilog RTL
- embedded C firmware
- AXI register interfaces
- Vivado block design integration
- Vitis deployment flow
- CNC motion sequencing and control

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

Document the final connections for:

- X step / direction
- Y step / direction
- Z step / direction
- stepper driver enable lines
- limit / homing inputs if used
- manual control buttons / switches if used

Suggested format:

```md
| Signal | Connected To | Notes |
| ------ | ------------ | ----- |
| X_STEP | ...          | ...   |
| X_DIR  | ...          | ...   |
| Y_STEP | ...          | ...   |
| Y_DIR  | ...          | ...   |
| Z_STEP | ...          | ...   |
| Z_DIR  | ...          | ...   |
```

### PS / PL Register Interface

The software and hardware communicate through AXI GPIO-backed registers.

The interface uses a small request/acknowledge handshake between the Processing
System (PS) and Programmable Logic (PL). The PL raises `MOUNT_REQ` when it wants
the PS to open and prepare a job. The PS answers with `MOUNT_OK` or `MOUNT_FAIL`.
After that, the PL requests the next motion entry by changing `REQ`. The PS writes
`X`, `Y`, `Z`, `SPEED`, and `LAST_LINE`, then updates `ACK` to the same phase only
after the data is ready. Matching `REQ` and `ACK` tells the PL that the next
motion command is valid and can be executed.

Typical categories:

- PS → PL:
    - `X`
    - `Y`
    - `Z`
    - `SPEED`
    - `ACK`
    - `MOUNT_OK`
    - `MOUNT_FAIL`
    - `LAST_LINE`

- PL → PS:
    - `REQ`
    - `MOUNT_REQ`

---

## Typical Runtime Flow

1. PS detects a mount request from the PL
2. PS mounts the SD card and opens `RUN.G`
3. PS preloads the first valid motion command
4. PL acknowledges and advances through phase-based requests
5. PS serves one motion at a time through AXI registers
6. PL executes the path in hardware
7. On cancel, the machine performs a controlled return-to-home sequence

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
