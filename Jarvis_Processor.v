module Jarvis_Processor(clock,reset,Switches,Display0,Display1,Display2,Display3,Display4,Display5,Display6,Display7);
 

	input clock, reset; // O clock da placa e o sinal de reset
	input [17:0] Switches; // Pois há 18 switches na FPGA Altera DE2-115
	output [6:0] Display0,Display1,Display2,Display3,Display4,Display5,Display6,Display7; //Os Displays de 7 segmentos da placa
	
	
	
	wire [31:0] Instruction, Read_Data1, Read_Data2, Write_Data,Immediate_Extend_J, Immediate_Extend, in2, out_ULA, Read_Data,PC_current,PC_next,PC_Branch,PC_Final;
	wire [5:0] Write_Register;
	wire [1:0] ALU_Op; // Fio do sinal de controle ALU op
	wire Branch,ALU_Source,Mem_Write, Mem_Read, Mem_to_Reg,Reg_Dest, Reg_Write,Jump; //Fios dos sinais de controle do datapath
	wire branch;//Fio que sai da Ula e sinaliza um branch, seria o zero da ula do mips
	wire [4:0] ALUControl; // Sinal de controle que sai da ALU Control
	wire clock_dividido; //Sai do divisor de frequência, é o clock de aproximadamente 1Hz, ou 1sg
	
	
	Divisor_Frequencia Divisor_Frequencia(.clkin(clock), .clkout(clock_dividido));
	
	PC_Register PC_Register(.PC_next(PC_Final), .clock(clock_dividido), .reset(reset), .PC_current(PC_current));
	
	PC_Adder PC_Adder(.PC_current(PC_current),.PC_next(PC_next),.reset(reset));
	
	Registers_Bank Registers_Bank(.Read_Register1(Instruction[26:21]),.Read_Register2(Instruction[20:15]),.Write_Register(Write_Register),.Write_Data(Write_Data),.Reg_Write(Reg_Write),.Read_Data1(Read_Data1),.Read_Data2(Read_Data2),.clock(clock_dividido));
	
	Instruction_Memory Instruction_Memory(.Read_Address(PC_current),.clock(clock),.Instruction(Instruction));

	
	
	//Unidade de Controle
	Jarvis_ControlUnit Jarvis_ControlUnit(.Op_Code(Instruction[31:27]),.Branch(Branch),.ALU_Op(ALU_Op),.ALU_Source(ALU_Source),.Mem_Write(Mem_Write),.Mem_Read(Mem_Read),.Mem_to_Reg(Mem_to_Reg),.Reg_Dest(Reg_Dest),.Reg_Write(Reg_Write),.Jump(Jump),.reset(reset));
	Jarvis_ALUControl Jarvis_ALUControl(.ALU_Op(ALU_Op),.Op_Code(Instruction[31:27]),.funct(Instruction[4:0]),.ALU_Control(ALU_Control));
	
	
	//Circuitos Extensores
	
	Extend_Circuit_add17 Extend_Circuit_add17(.in_15(Instruction[14:0]),.out_32(Immediate_Extend));
	
	Extend_Circuit_add5 Extend_Circuit_add5(.in_27(Instruction[26:0]),.out_32(Immediate_Extend_J));
	
	
	//ULA	
	JarvisULA JarvisULA(.in1(Read_Data1), .in2(in2),.out(out_ULA),.branch(branch),.shamt(Instruction[8:5]),.ALU_Control(ALU_Control));
	

	
	//Memória de Dados
	Data_Memory Data_Memory(.Write_Data(Read_Data2),.Address(out_ULA), .Mem_Read(Mem_Read),.Mem_Write(Mem_Write),.clock(clock_dividido),.Read_Data(Read_Data));
	
	
	
	//Multiplexadores
	
	Mux_Reg_Dst Mux_Reg_Dst(.Reg_20_15(Instruction[20:15]),.Reg_14_09(Instruction[14:9]), .Reg_Dest(Reg_Dest),.Write_Register(Write_Register));
	
	
	Mux_Mem_to_Reg Mux_Mem_to_Reg(.out_ULA(out_ULA),.Read_Data(Read_Data),.Mem_to_Reg(Mem_to_Reg),.Write_Data(Write_Data));
	
	Mux_Branch Mux_Branch(.PC_next(PC_next),.PC_next_I(Immediate_Extend),.Branch_ULA(branch),.Branch(Branch),.PC_Branch(PC_Branch));
	
	Mux_Jump Mux_Jump(.PC_Branch(PC_Branch),.Immediate_Extend_J(Immediate_Extend_J),.Jump(Jump),.PC_Final(PC_Final));
	
	Mux_ALU_Source Mux_ALU_Source(.Read_Data2(Read_Data2),.Immediate_Extend(Immediate_Extend),.ALU_Source(ALU_Source),.in2(in2));
	

	

endmodule