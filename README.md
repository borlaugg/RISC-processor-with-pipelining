# RISC-pipeline-processor
This is a repository containg code for a 6 staged pipelined processor.

Developed during the Spring 2022 Microprocessor course at IITB, this project is an implementation of a pipelined MIPS processor featuring hazard detection, branch prediction as well as forwarding. This implementation is based on a limited ISA, the details for which are present in MIPS_ISA.png. This code is synthesizable and can be run. I used Quartus for testing purposes. The components have been individually tested but not as a unit due to the large number of i/o pins required for synthesis.

The problem statement is available as a pdf in `docs/Project2-Bonus-RISC-IITB.pdf`

There are five pipeline stages: 

## Under the hood

1. Instruction Fetch
2. Instruction Decode
3. Register Read
4. Execution
5. Memory
6. Write Back
