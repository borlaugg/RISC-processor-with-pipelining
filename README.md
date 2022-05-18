# RISC-pipeline-processor
This is a repository containg code for a 6 staged pipelined processor.

Developed during the Spring 2022 Microprocessor course at IITB, this project is an implementation of a pipelined MIPS processor featuring hazard detection, branch prediction as well as forwarding. This implementation is based on a limited ISA, the details for which are present in `docs/ISA.png`. This code is synthesizable and can be run. Intel Quartus was used for testing purposes. The components have been individually tested but not the processor as a unit due to the large number of i/o pins required for synthesis (could not be synthesized on my laptop).

The problem statement is available as a pdf in `docs/Project2-Bonus-RISC-IITB.pdf`



There are five pipeline stages: 

## Under the hood

There are six pipeline stages:

1. Instruction Fetch
2. Instruction Decode
3. Register Read
4. Execution
5. Memory
6. Write Back

The top level entity is the datapath which incorporates all other components. 
A Data Hazard unit has been made that signals if it detects a hazard which is used in data forwarding. 
 
 ## Branch Predictor
The branch predictor, present in `Modules/BranchPredictor.vhdl`  detects a branching instruction and calls for a stall for five clock cycles. The three cycles are for the branch instruction to finish execution stage and the last as a buffer to allow the program counter to read.
![alt text](https://github.com/borlaugg/RISC-processor-with-pipelining/blob/main/docs/BP.png)
<p align="center">
  <img 
    width="300"
    height="300"
    src="https://github.com/borlaugg/RISC-processor-with-pipelining/blob/main/docs/BP.png"
  >
</p>
