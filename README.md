# Fault-Tolerant FSM using Hamming Distance (Verilog)

## Overview
This project implements a fault-tolerant finite state machine (FSM) using Hamming distance-based state encoding. The design ensures that single-bit errors in the state register can be detected and corrected.

## Key Concepts
- Hamming Distance ≥ 3 between valid states
- Single Event Upset (SEU) detection
- Error correction through nearest valid state mapping
- Fault injection via testbench

## Architecture
# Fault-Tolerant FSM using Hamming Distance (Verilog)

## Overview
This project implements a fault-tolerant finite state machine (FSM) using Hamming distance–based state encoding. The design ensures that single-bit errors in the state register can be detected and corrected while preserving the intended state transition sequence.

## Key Concepts
- Hamming Distance ≥ 3 between valid states
- Single Event Upset (SEU) detection
- Error correction through nearest valid state mapping
- Fault injection through testbench
- State transition recovery after bit-flip faults

## Architecture
The system consists of:

FSM Core – Implements the original state transition logic  
Error Injection Module – Simulates bit-flip faults in the state register  
Hamming Distance Module – Computes distance between possible states  
Correction Module – Maps invalid states to the nearest valid state  

## Fault Tolerance Principle
Valid states are encoded such that:

Hamming Distance(valid_state_i , valid_state_j) ≥ 3

This guarantees that any single-bit flip from a valid state produces an invalid state that can be uniquely corrected back to the nearest valid state.

## Design Assumption for Practical Fault Recovery
In practical digital systems exposed to radiation (such as satellites), **single-event upsets (SEU)** typically cause a **single-bit flip in a flip-flop**.

In this design, an important assumption is used to maintain the correct FSM transition flow:

- A fault causes a **single-bit flip relative to the previous valid state**
- The resulting corrupted state is therefore **nearest to the previous valid state**
- The correction logic maps this invalid state back to the correct valid state

This approach ensures that the **original state transition sequence is preserved**, which is a limitation in many conventional fault-tolerant FSM designs.

By encoding valid states with **Hamming distance ≥ 3**, any single-bit corruption produces a detectable invalid state that can be corrected.

## Simulation
Simulation was performed using Vivado.

The waveform demonstrates:
- Normal FSM operation
- Fault injection (bit-flip in state register)
- Detection of invalid state
- Automatic correction to the nearest valid state
- Continuation of correct state transition sequence

## Applications
- Radiation-tolerant digital systems
- Aerospace electronics
- Safety-critical embedded systems

Similar fault mitigation techniques are used in **space electronics** to handle radiation-induced faults in extreme environments.

## Author
Pratyush Ojha
