# RTL-DSP-with-Verification
A parameterized, pipelined Digital Signal Processor core in Verilog HDL with pre-adder, multiplier, and post-adder components. Features configurable operation modes, multiple register stages, and comprehensive verification. Fully implemented on FPGA with Xilinx Vivado, demonstrating RTL design and verification expertise.
Pipelined DSP Core
A parameterized Digital Signal Processor (DSP) implementation in Verilog HDL with complete verification and FPGA synthesis.
Overview
This project implements a configurable DSP slice similar to those found in modern FPGAs. The design features a pipelined architecture with pre-adder, multiplier, and post-adder units, supporting various operation modes for efficient signal processing.
Features

18-bit input operands (A, B, D)
48-bit input operand (C)
36-bit multiplier output (M)
48-bit post-adder output (P)
Configurable pipeline stages
Parameterized operation modes
Synchronous/asynchronous reset options
Full clock enable control for all register stages

Architecture
The DSP core consists of:

Input Processing

Registers for A, B, C, D inputs with independent clock enables
Optional two-stage pipeline for A inputs (A0REG, A1REG)
Optional two-stage pipeline for B inputs (B0REG, B1REG)


Pre-Adder/Subtractor

Performs D+B or D-B operations based on OPMODE


Multiplier

18x18 bit multiplication with registered output (MREG)
Processes A and B inputs after the pre-adder stage


Post-Adder

Configurable operation based on OPMODE signals
Supports accumulation with previous results
Selectable inputs from multiple sources



Implementation Details

Coded in Verilog HDL
Synthesized using Xilinx Vivado
Verified with comprehensive testbench
100% toggle coverage achieved
XDC constraints file included

Directory Structure
├── rtl/                # RTL design files
│   ├── DSP.v           # Main DSP module
│   ├── mux.v           # Multiplexer implementation
│   ├── mux_4.v         # 4-to-1 multiplexer
│   └── post_adder.v    # Post-adder implementation
├── verification/       # Verification files
│   ├── DSP_tb.v        # Verilog testbench
│   └── DSP_tb.sv       # SystemVerilog testbench
├── constraints/        # FPGA implementation constraints
│   └── Constraints_mini.xdc
├── images/             # Project screenshots
└── docs/               # Additional documentation
    └── coverage_rpt.txt # Coverage report
Usage
Simulation
To simulate the design:

Clone the repository
Navigate to the verification directory
Run the testbench with your preferred simulator:
iverilog -o dspsim DSP_tb.v ../rtl/*.v
vvp dspsim


FPGA Implementation
To implement on an FPGA:

Add all RTL files to your Vivado project
Include the constraint file for proper timing
Run synthesis and implementation
Program your device with the generated bitstream

Acknowledgments

Based on modern DSP slice architectures found in FPGAs
Designed as part of digital design coursework
