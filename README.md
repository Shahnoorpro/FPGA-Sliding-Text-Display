# FPGA-Based Scrolling Student ID Display

## 📌 Project Overview
This project is a Digital Logic Design implementation on a **Xilinx Spartan-3 FPGA**. It features a scrolling text display on a 4-digit 7-segment module. The system allows switching between two different Student IDs and includes pause/resume functionality.

## 📸 Block Diagram
*(<img width="4096" height="2260" alt="image" src="https://github.com/user-attachments/assets/3e00d317-922d-49e0-8578-72f665f9ae72" />
)*

### 🎯 Key Features
* **Dual ID Support:** Toggles between Student 1 (`SP24-ELC-068`) and Student 2 (`SP24-ELC-087`).
* **Scrolling Text:** Characters scroll right-to-left using a custom window counter.
* **Speed Control:** Scroll speed is managed by a dedicated clock divider (~3Hz).
* **Interactive Controls:**
    * **Toggle Switch:** Selects the student ID.
    * **Push Button:** Pauses/Resumes the scrolling (implemented via FSM).

---

## 🛠 Technical Specifications
* **Hardware:** Xilinx Spartan-3 FPGA (XC3S200-FT256)
* **Clock:** 50 MHz External Oscillator
* **Language:** Verilog HDL
* **Synthesis Tool:** Xilinx ISE / Vivado

---

## 📂 File Structure
The project is modularized into the following Verilog files:

### **Top Level**
* `top_scrolling_display.v` - **Top Module:** Interconnects all sub-modules and handles I/O.
* `top.ucf` - **Constraints File:** Maps the FPGA pins (Clock, Buttons, LEDs) to the board.

### **Control & Timing**
* `fsm_controller.v` - **Finite State Machine:** Manages RUN/STOP states for the scrolling.
* `clock_divider_slide.v` - Generates the slow clock for text scrolling.
* `clock_divider_tick.v` - Generates the fast clock for display multiplexing.
* `edge_detector.v` - Detects button presses for the pause logic.
* `debouncer_pause.v` & `debouncer_select.v` - Filters mechanical noise from buttons/switches.

### **Data Path & Display**
* `rom_student_1.v` & `rom_student_2.v` - Look-Up Tables containing the hex codes for the student IDs.
* `student_mux.v` - Multiplexer to select between the two ROM outputs.
* `window_counter.v` - Tracks the current starting position of the text window.
* `addr_calc.v` - Calculates the correct character address based on the window position.
* `seven_seg_decoder.v` - Decodes the character data into 7-segment cathode signals.
* `anode_logic.v` - Controls the active digit for multiplexing.

---

## 🚀 How to Run
1.  **Create Project:** Open Xilinx ISE (or supported tool) and create a new project for **Spartan-3 (XC3S200)**.
2.  **Add Files:** Import all `.v` files from the `src` folder.
3.  **Add Constraints:** Import `top.ucf` to assign pins correctly.
4.  **Synthesize & Program:** Generate the bitstream and flash it to the FPGA board using JTAG.

---

### 👤 Created By
**Muhammad Shah Noor Ullah** Connect with me on LinkedIn: [linkedin.com/in/proshahnoor](https://www.linkedin.com/in/proshahnoor)
