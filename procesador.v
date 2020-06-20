module precesador(
    input clk
);

wire [63:0] cable_PC;//program counter
wire [31:0] cable_IM;//instruccion memory
wire [63:0] cable_Sum1;//sum1
wire [4:0] cable_Mux_RegWrSrc;//Mux_RegWrSrc
wire [4:0] cable_Mux_RegRd2Src;//Mux_Reg2Sel
wire [63:0] cable_SEU;//SEU
wire [63:0] cable_RdReg1;//register file
wire [63:0] cable_RdReg2;//register file
//control unit
wire cable_RegRd2Src;
wire cable_RfWr;
wire cable_SEUSrc;
wire cable_ALUSrcB;
wire[3:0] cable_ALUOp;
wire cable_MemWr;
wire cable_MemRd;
wire cable_PCSrc;
wire cable_RFDataWrSrc;
wire cable_RfWrScr;
///////////////
wire [63:0] cable_Mux_AluSrc;//Mux_AluSrc
wire [63:0] cable_Sum2;//sum2
wire [63:0] cable_Alu;//ALU
wire cable_Z;//cable Z de alu
wire [63:0] cable_Mux_PCSrc;//Mux_PCSrc
wire [63:0] cable_DM;//data memory
wire [63:0] cable_Mux_RFDataWrSrc;//Mux_RFDataWrsrc




//wire [4:0] cable_Mux_Reg2Sel;//Mux_Reg2Sel
//wire [63:0] cable_Mux_RFDataSel;//Mux_RFDataSel


//primero nombre modulo segundo cualquiera instancia
Control_unit CU(
    .Z(cable_Z),
    .Inst(cable_IM[31:21]),
    .Reg2Sel(cable_RegRd2Src),
    .RfWr(cable_RfWr),
    .SEU(cable_SEUSrc),
    .ALUSrcB(cable_ALUSrcB),
    .ALUOp(cable_ALUOp),
    .MemWr(cable_MemWr),
    .MemRd(cable_MemRd),
    .PCSrc(cable_PCSrc),
    .WrDataSel(cable_RFDataWrSrcDataSel),
    .RfWrScr(cable_RfWrScr)
);

PC PC(
    .in_pc(cable_Mux_PCSrc),
    .clk(clk),
    .out_pc(cable_PC)
);

Data_memory DM(
    .Address(cable_Alu),
    .Datawr(cable_RdReg2),
    .MemWr(cable_MemWr),
    .MemRd(cable_MemRd),
    .DM(cable_DM)
);

Mux_AluSrc Mux_AluSrc(
    .Register_file(cable_RdReg2),
    .SEU(cable_SEU),
    .AluSrc(cable_ALUSrcB),
    .out_Mux_AluSrc(cable_Mux_AluSrc)
);
    
Mux_Reg2Sel Mux_Reg2Sel(
    .Rm(cable_IM[20:16]),
    .Rt(cable_IM[4:0]),
    .Reg2Sel(cable_RegRd2Src),
    .out_Mux_Reg2Sel(cable_Mux_RegRd2Src)
);
    
Mux_RegWrSrc Mux_RegWrSrc(
    .Rt(cable_IM[4:0]),
    .RegWrSrc(cable_RfWrScr),
    .out_Mux_RegWrSrc(cable_Mux_RegWrSrc)
);

Mux_PCSrc Mux_PCSrc(    
    .Sum1(cable_Sum1),
    .sum2(cable_Sum2),
    .PCSrc(cable_PCSrc),
    .out_Mux_PCSrc(cable_Mux_PCSrc)
);

Mux_RFDataWrSrc Mux_RFDataWrSrc(
    .Data_memory(cable_DM),
    .Alu(cable_Alu),
    .Sum1(cable_Sum1),
    .RFDataSel(cable_RFDataWrSrc),
    .out_Mux_RFDataSel(cable_Mux_RFDataWrSrc)
);
module procesador2(
    input clk,
    input [7:0]sch
    
    //output reg [63:0] alu_salida
    );
//control unit

    wire  cc_RegRd2Src;
    wire  cc_RfWr;
    wire  [1:0]cc_SEU;
    wire  cc_ALUSrcB;
    wire  [3:0] cc_ALUOp;
    wire  cc_MemWr;
    wire  cc_MemRd;
    wire  [1:0] cc_PCSrc;
    wire  [1:0] cc_WrDataSel;
    wire  cc_RfWrScr;
    //wire  cc_flagsWR;
    
    //wire [3:0] cc_out_flags;
    wire [4:0] cc_out_Mux_Reg2Sel;//Mux REG2sel
    wire [63:0] cc_out_Mux_AluSrc;//Mux AluSrc
    wire [63:0] cc_AluRes;//alu
    wire [1:0]cc_N;//alu N
    wire cc_Z;//alu Z
    wire [63:0] cc_out_Sum2;//sum2
    wire [63:0] cc_out_Sum1;//sum1
    wire [63:0] cc_SEU_out;//SEU
    wire [63:0] cc_RdReg1;//register file
    wire [63:0] cc_RdReg2;//register file
    wire [63:0] cc_out_Mux_RFDataSel;//mux rfdatasel
    wire [63:0] cc_out_Mux_PCSrc;//mux pc src
    wire [31:0] cc_Instruccion; //instruccion memory
    wire [4:0] cc_out_Mux_RegWrSrc;//mux rewrsrc 
    wire [63:0] cc_out_pc;//pc
    wire [63:0] cc_DM;//data emory
    wire [7:0] cc_led;


/*banderas banderas(
    .in_flags(cc_Z[3:0]),
    .flagsWr(cc_flagsWR),
    .clk(clk),
    .out_flags(cc_out_flags)
    );  */
       
Mux_Reg2Sel Mux_Reg2Sel(
    .Rm(cc_Instruccion[20:16]),
    .Rt(cc_Instruccion[4:0]),
    .Reg2Sel(cc_RegRd2Src),
    .out_Mux_Reg2Sel(cc_out_Mux_Reg2Sel)

    );    

Control_unit Control_unit(
    .Inst(cc_Instruccion[31:21]),
    .Z(cc_Z),
    .N(cc_N),
    .con_flags(cc_Instruccion[3:0]),
    .RegRd2Src(cc_RegRd2Src),
    .RfWr(cc_RfWr),
    .SEU(cc_SEU),
    .ALUSrcB(cc_ALUSrcB),
    .ALUOp(cc_ALUOp),
    .MemWr(cc_MemWr),
    .MemRd(cc_MemRd),
    .PCSrc(cc_PCSrc),
    .WrDataSel(cc_WrDataSel),
    .RfWrScr(cc_RfWrScr)
);

Data_memory Data_memory(
    .Address(cc_AluRes),
    .Datawr(cc_RdReg2),
    .MemWr(cc_MemWr),
    .MemRd(cc_MemRd),
    .DM(cc_DM),
    .clk(clk),
    .sch(sch),
    .led(cc_led)
 
    ); 
      
PC PC(
    .in_pc(cc_out_Mux_PCSrc),
    .clk(clk),
    .out_pc(cc_out_pc)
    
    );   
 
Mux_RegWrSrc Mux_RegWrSrc(
    .Rt(cc_Instruccion[4:0]),
    .RegWrSrc(cc_RfWrScr),
    .out_Mux_RegWrSrc(cc_out_Mux_RegWrSrc)

    );
   
Instruccion_memory Instruccion_memory(
    .Address(cc_out_pc),
    .Instruccion(cc_Instruccion) 
    );    
 
Mux_PCSrc Mux_PCSrc(    
    .Sum1(cc_out_Sum1),
    .sum2(cc_out_Sum2),
    .RdReg2(cc_RdReg2),
    .PCSrc(cc_PCSrc),
    .out_Mux_PCSrc(cc_out_Mux_PCSrc)

    );    

Mux_RFDataWrSrc Mux_RFDataWrSrc(
    .Data_memory(cc_DM),
    .Alu(cc_AluRes),
    .Sum1(cc_out_Sum1),
    .RFDataSel(cc_WrDataSel),
    .out_Mux_RFDataSel(cc_out_Mux_RFDataSel)

    );    
 
Register_file Register_file(
    .Rn(cc_Instruccion[9:5]),
    .Rm(cc_out_Mux_Reg2Sel),
    .WrReg(cc_out_Mux_RegWrSrc),
    .WrData(cc_out_Mux_RFDataSel),
    .RfWr(cc_RfWr),
    .clk(clk),
    .RdReg1(cc_RdReg1),
    .RdReg2(cc_RdReg2)
    );
 
SEU SEU(
    .Inst(cc_Instruccion[25:0]),
    .SEUScr(cc_SEU),
    .SEU_out(cc_SEU_out)
    );
 
Sum1 Sum1(
    .PC(cc_out_pc),
    .out_Sum1(cc_out_Sum1)
    );
    
Sum2 Sum2(
    .PC(cc_out_pc),
    .SEU(cc_SEU_out),
    .out_Sum2(cc_out_Sum2)

    );    
  
Alu Alu(
    .A(cc_RdReg1),
    .B(cc_out_Mux_AluSrc),
    .Shamp(cc_Instruccion[15:10]),
    .Aluopt(cc_ALUOp),
    .AluRes(cc_AluRes),
    .Z(cc_Z),
    .N(cc_N)
    //output N
    );

Mux_AluSrc Mux_AluSrc(
    .Register_file(cc_RdReg2),
    .SEU(cc_SEU_out),
    .AluSrc(cc_ALUSrcB),
    .out_Mux_AluSrc(cc_out_Mux_AluSrc)

    );    
endmodule