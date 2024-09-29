`include "ProgramCounter.v"
`include "InstrMemory.v"
`include "registerfile.v"
`include "ImmediateGenerator.v"
`include "DataMemory.v"
`include "Control.v"
`include "ALUunit.v"
`include "ALUcontrol.v"
`include "Multiplexors.v"
`include "AdderAnd.v"

module top(clk, reset);

input clk,reset;
wire [31:0] pc_top, pcPlus4_top, intstruction_top, Reg_rd1_top, Reg_rd2_top, imm_top, Mux1_top, adder_top, 
            PCin_top, ALU_Result_top, Mem_rd_top, Reg_wr_top;
wire RegWrite_top, ALUSrc_top, branch_top, zero_top, AND_top, MemWrite_top, MemRead_top, MemtoReg_top;
wire [1:0] ALUOp_top;
wire [3:0] control_top;

//PC
Program_Counter PC(.clk(clk), .reset(reset), .PC_in(PCin_top), .PC_out(pc_top)); 

//PC Adder
PCplus4 PCplus4(.fromPC(pc_top),.NextPC(pcPlus4_top));

//Instruction Memory
Instruction_Memory InstrMemory(.clk(clk), .reset(reset), .pc(pc_top), .instr(intstruction_top));

//Register File
RegisterBlock RegisterBlock(.clk(clk), .reset(reset), .rs1(intstruction_top[19:15]), .rs2(intstruction_top[24:20]), 
.rd_data1(Reg_rd1_top), .rd_data2(Reg_rd2_top), .wrEn(RegWrite_top), .ws(intstruction_top[11:7]), .wr_data(Reg_wr_top));

//Immediate Generator
ImmGen ImmGen(.Opcode(intstruction_top[6:0]), .instruction(intstruction_top), .ImmOutput(imm_top));

//Control Unit
Control ControlBlock(.instruction(intstruction_top[6:0]), .Branch(branch_top), .MemRead(MemRead_top), .MemtoReg(MemtoReg_top), .ALUOp(ALUOp_top), 
.MemWrite(MemWrite_top), .ALUSrc(ALUSrc_top), .RegWrite(RegWrite_top));

//ALU Control 
ALU_Control ALU_Control(.fun7(intstruction_top[30]), .fun3(intstruction_top[14:12]), .ALUOp(ALUOp_top), .control_out(control_top));

//ALU
ALU ALU(.a(Reg_rd1_top), .b(Mux1_top), .ALU_Result(ALU_Result_top), .alu_control(control_top), .zero(zero_top));

//ALU Mux
Mux1 ALU_Mux(.sel1(ALUSrc_top), .A1(Reg_rd2_top), .B1(imm_top), .Mux1_out(Mux1_top));

//Adder
Adder adder(.i1(pc_top), .i2(imm_top), .sum(adder_top));

//AND
andGate andGate(.branch(branch_top), .zero(zero_top), .and_out(AND_top));

//Adder Mux
Mux2 Adder_Mux(.sel2(AND_top), .A2(pcPlus4_top), .B2(adder_top), .Mux2_out(PCin_top));

//Data Memory
DataMemory DataMemory(.clk(clk), .reset(reset), .MemWrite(MemWrite_top), .MemRead(MemRead_top), .Mem_Addr(ALU_Result_top), 
.wr_data(Reg_rd2_top), .rd_data(Mem_rd_top));

//Memory Mux
Mux3 Memory_Mux(.sel3(MemtoReg_top), .A3(ALU_Result_top), .B3(Mem_rd_top), .Mux3_out(Reg_wr_top));

endmodule



