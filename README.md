# 32×32 Register File in Verilog HDL

## Overview

This project implements a **32×32 Register File** using Verilog HDL. The register file consists of 32 general-purpose registers, each 32 bits wide, with one synchronous write port and two asynchronous read ports. The design is parameterized, making it scalable and reusable for different data widths and register counts. Functional verification was performed using a custom Verilog testbench in Xilinx Vivado.

---

## Features

- 32 Registers × 32-bit Data Width
- Parameterized Design
- Single Synchronous Write Port
- Dual Asynchronous Read Ports
- Active-High Reset
- Register 0 Write Protection
- Functional Verification using Testbench
- Implemented and Simulated in Xilinx Vivado

---

## Parameters

| Parameter | Value | Description |
|-----------|------:|-------------|
| `data_width` | 32 | Width of each register |
| `num_reg` | 32 | Total number of registers |
| `addr_width` | 5 | Address width (2⁵ = 32 registers) |

---

## Inputs

| Signal | Width | Description |
|--------|------:|-------------|
| clk | 1 | Clock signal |
| reset | 1 | Active-high reset |
| writeenable | 1 | Enables write operation |
| write_address | 5 | Register address for writing |
| write_data | 32 | Data to be written |
| read_address1 | 5 | Read address for Port 1 |
| read_address2 | 5 | Read address for Port 2 |

---

## Outputs

| Signal | Width | Description |
|--------|------:|-------------|
| read_data1 | 32 | Data from Read Port 1 |
| read_data2 | 32 | Data from Read Port 2 |

---

## Working

- Registers are implemented using a Verilog memory array.
- Data is written only on the **positive edge of the clock** when `writeenable` is HIGH.
- Both read ports operate **asynchronously**, meaning data is available immediately when the read address changes.
- When `reset` is asserted, all registers are initialized to zero.
- Writes to **Register 0** are ignored, keeping it permanently zero.

---

## Verification

The register file was verified using a custom Verilog testbench.

The following test cases were performed:

- Reset Operation
- Write to Register 6
- Read from Register 6
- Write to Register 9
- Read from Register 9
- Register 0 Write Protection
- Write Disable Verification
- Dual-Port Read Verification

---

## Repository Structure

```
32x32-Register-File-Verilog/
│
├── registerfile.v
├── registerfile_tb.v
├── register_waveform.png
├── testbench_output.png
└── README.md
```

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
---

## Future Improvements

- Multi-port Register File
- Synchronous Read Register File
- Integration with a 32-bit ALU
- Processor Datapath Implementation

---

## Author

**Shrinithi K L**

ECE Student | RTL Design | Digital Design | VLSI Enthusiast
