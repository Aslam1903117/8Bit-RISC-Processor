# 8Bit-RISC-Processor

## Introduction
This repository hosts an 8-bit RISC processor designed in Verilog, developed as part of a personal project to demonstrate digital design skills. The project features a modular architecture with support for key instructions (ADD, SUB, LOAD, STORE, JUMP), verified through ModelSim simulation. It showcases my abilities in digital design and prepares me to contribute to innovative semiconductor solutions.

## Project Specifications
The 8-bit RISC processor was designed with the following specifications:

- **Instruction Set**:
  - `ADD R1, R2, R3`: Adds the contents of registers R2 and R3, storing the result in R1.
  - `SUB R1, R2, R3`: Subtracts R3 from R2, storing the result in R1.
  - `LOAD R1, IMM`: Loads an 8-bit immediate value into register R1.
  - `STORE R1, IMM`: Stores the contents of R1 into Data Memory at the address specified by IMM.
  - `JUMP IMM`: Jumps to the instruction at the address specified by IMM.
- **Architecture**:
  - **Data Path**: 8-bit wide.
  - **Registers**: 4 general-purpose registers (R0–R3), each 8-bit.
  - **Memory**:
    - Instruction Memory: 8-bit address space (256 locations), preloaded with a test program.
    - Data Memory: 8-bit address space (256 locations) for LOAD/STORE operations.
  - **Instruction Format**: 16-bit instructions:
    - 4-bit opcode (e.g., `ADD` = 0001, `LOAD` = 0011).
    - 2-bit fields for destination and source registers (e.g., R1 = 01).
    - 8-bit immediate value for LOAD, STORE, and JUMP.
  - **Execution**: Single-cycle execution for simplicity (each instruction completes in one clock cycle).
- **Simulation Goal**: Execute a test program that loads a value (5) into R1, adds R1 to itself (result: 10), and stores the result in Data Memory at address 2.

## Work Methodology
The project was completed following a structured approach to ensure clarity, functionality, and alignment with digital design principles. Below is the methodology used:

1. **Requirement Analysis**:
   - Defined the instruction set based on common RISC operations, focusing on arithmetic (ADD, SUB), data movement (LOAD, STORE), and control flow (JUMP).
   - Specified a minimal architecture to keep the design manageable while demonstrating key concepts like datapath and control logic.

2. **Design and Modularization**:
   - Divided the processor into distinct modules for better organization and debugging:
     - **Program Counter (PC)**: Manages instruction fetch by incrementing the address or jumping to a new address.
     - **Instruction Memory**: Stores the program (preloaded with test instructions).
     - **Register File**: Handles read/write operations for 4 registers.
     - **ALU**: Performs arithmetic operations (ADD, SUB).
     - **Data Memory**: Supports LOAD and STORE operations.
     - **Control Unit**: Decodes instructions and generates control signals (e.g., reg_write, mem_write, jump).
     - **Top Module**: Integrates all modules into a cohesive processor.
   - Designed a 16-bit instruction format to encode operations, registers, and immediate values.

3. **Implementation**:
   - Wrote Verilog code for each module, ensuring proper interfacing (e.g., matching input/output ports).
   - Created a testbench to simulate the processor, including clock generation, reset logic, and debugging output.
   - Preloaded Instruction Memory with a test program: `LOAD R1, 5`, `ADD R1, R1, R1`, `STORE R1, 2`.

4. **Simulation and Verification**:
   - Used ModelSim to simulate the design:
     - Compiled all Verilog files in ModelSim.
     - Loaded the testbench and added key signals (e.g., PC, registers, memory) to the waveform viewer.
     - Ran the simulation for 70ns to observe the execution of the test program.
   - Verified functionality:
     - Program Counter incremented correctly (0 → 1 → 2).
     - Register R1 updated from 0 to 5 (LOAD), then to 10 (ADD).
     - Data Memory at address 2 stored the value 10 (STORE).

5. **Documentation**:
   - Documented the project in this README, including specifications, methodology, and results.
   - Prepared the project for GitHub hosting to showcase to potential employers.

## Project Structure
- `pc.v`: Program Counter module.
- `instruction_memory.v`: Instruction Memory module.
- `register_file.v`: Register File module.
- `alu.v`: Arithmetic Logic Unit module.
- `data_memory.v`: Data Memory module.
- `control_unit.v`: Control Unit module.
- `top_module.v`: Top-level module integrating all components.
- `testbench.v`: Testbench for simulation in ModelSim.
- `README.md`: This file with project details.

## How to Run in ModelSim
### Prerequisites
- **ModelSim**: Installed and configured (Student Edition or higher).
- **Verilog Knowledge**: Basic understanding of Verilog syntax.

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Aslam1903117/8Bit-RISC-Processor.git
   cd 8Bit-RISC-Processor
