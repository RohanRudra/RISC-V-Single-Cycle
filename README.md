# RISC-V-Single-Cycle-Processor-Implementation

This project demonstrates the implementation of a simplified **RISC-V processor core** in Verilog, focusing on essential components such as the Program Counter, ALU, Control Unit, and Data Memory. This is a fundamental digital logic design project which simulates a basic RISC-V architecture supporting common arithmetic, logical, and memory operations.

## Key Features
- **32-bit RISC-V Processor**: Implements a subset of the RISC-V ISA with support for basic ALU operations (add, subtract, AND, OR), memory read/write, and branch operations.
- **Modular Design**: The processor core is designed using a modular, hierarchical approach, ensuring clarity and extensibility. 
  - **Program Counter (PC)**
  - **Instruction Memory**
  - **Register File**
  - **ALU (Arithmetic Logic Unit)**
  - **Immediate Generator**
  - **Control Unit**
  - **Data Memory**
  - **Multiplexors**
  - **Adder & AND Gate**
- **ALU Control Logic**: Includes a separate control unit for the ALU to determine the required arithmetic or logic operation based on instruction decoding.
- **Pipeline-ready architecture**: The processor design follows a structure that could be extended to a pipelined architecture.

## Architecture Overview

The processor performs the following operations in each clock cycle:
1. **Instruction Fetch**: Fetches the current instruction from the instruction memory based on the value of the Program Counter (PC).
2. **Instruction Decode**: Decodes the instruction, determining the opcode, source registers, and destination register.
3. **ALU Operation**: Executes arithmetic/logic operations such as ADD, SUB, AND, OR, etc.
4. **Memory Access**: If applicable, performs memory read/write operations based on the instruction type.
5. **Write-back**: Writes the result of the operation back to the register file, completing the instruction execution.

## Project Structure

The project is broken down into the following Verilog modules:

1. **Top Module (`Top.v`)**
   - Instantiates and connects all the modules of the processor.
   - Handles control signals, data paths, and PC updates.

2. **Program Counter (`ProgramCounter.v`)**
   - Maintains the current instruction address and updates the PC every clock cycle.

3. **Instruction Memory (`InstrMemory.v`)**
   - Holds the instructions for the processor to execute.

4. **Register File (`registerFile.v`)**
   - Holds 32 registers for storing intermediate data during execution.
   - Supports simultaneous reads from two registers and a write-back into one register.

5. **ALU & ALU Control (`ALUunit.v`, `ALUcontrol.v`)**
   - ALU performs basic arithmetic and logical operations.
   - ALU Control Unit decodes the operation type (add, sub, AND, OR) based on the instruction's function code.

6. **Control Unit (`Control.v`)**
   - Decodes the opcode of the instruction to generate control signals for other modules, such as the ALU and memory.

7. **Immediate Generator (`ImmediateGenerator.v`)**
   - Decodes immediate values from instructions, handling sign-extension for various instruction types (I-type, S-type, etc.).

8. **Data Memory (`DataMemory.v`)**
   - Provides read/write access to memory, based on the instructions (load/store).

9. **Multiplexors (`Multiplexors.v`)**
   - Multiple multiplexors are used to handle selection between ALU inputs, PC update logic, and write-back data.

10. **Testbench (`tb.v`)**
    - Simulates the entire processor and verifies the correctness of the design through test cases.

