module Control_unit(
    input [10:0] Inst,
    input Z,
    input [1:0]N,
    input [3:0] con_flags,
    output reg RegRd2Src,
    output reg RfWr,
    output reg [1:0] SEU,
    output reg ALUSrcB,
    output reg [3:0] ALUOp,
    output reg MemWr,
    output reg MemRd,
    output reg [1:0] PCSrc,
    output reg [1:0] WrDataSel,
    output reg RfWrScr
    //output reg flagsWR
    );

always @(*)begin
        
        //AND
    if(Inst == 11'B10001010000)    
        begin
            RegRd2Src = 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 2;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end
        
        //ADD
    else if(Inst == 11'B10001011000)
        begin
            RegRd2Src <= 0;
            RfWr = 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 0;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //ORR
    else if(Inst == 11'B10101010000)    
        begin
            RegRd2Src <= 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 3;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //SUB
    else if(Inst == 11'B11001011000)    
        begin
            RegRd2Src = 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 1;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
      /////////////////////////////////////  
     else if(Inst == 11'B11101011000)    
        begin
            RegRd2Src <= 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 1;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end
        
        //LSL
    else if(Inst == 11'B11010011011)     
        begin
            RegRd2Src <= 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 6;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //BR
    else if(Inst == 11'B11010110000) 
        begin
            RegRd2Src <= 0;
            RfWr <= 0;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 8;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 2;
            WrDataSel <= 1;
            RfWrScr <= 1;
        end 
        
        //ADDS
    else if(Inst == 11'B10101011000)
        begin
            RegRd2Src <= 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 1;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //SUBS
    else if(Inst == 11'B11101011000)
        begin
            RegRd2Src <= 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 2;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //LSR
    else if(Inst == 11'B11010011010)
        begin
            RegRd2Src = 0;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 0;
            ALUOp <= 7;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //STUR
    else if(Inst == 11'B11111000000)
        begin
            RegRd2Src = 1;
            RfWr <= 0;
            SEU <= 1;
            ALUSrcB <= 1;
            ALUOp <= 0;
            MemWr <= 1;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //LDUR
    else if(Inst == 11'B11111000010)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 1;
            ALUSrcB <= 1;
            ALUOp <= 0;
            MemWr <= 0;
            MemRd <= 1;
            PCSrc <= 0;
            WrDataSel <= 0;
            RfWrScr <= 0;
        end 
        
        //ADDI

    else if(Inst[10:1] == 10'B1001000100)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 1;
            ALUOp <= 0;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end   
        
        //SUBI
    else if(Inst[10:1] == 10'B1101000100)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 1;
            ALUOp <= 1;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end  
        
        //ANDI
    else if(Inst[10:1] == 10'B1001001000)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 0;
            ALUSrcB <= 1;
            ALUOp <= 2;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 0;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end   
        
        //B.cond
    else if(Inst[10:3] == 8'B01010100)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 3;
            ALUSrcB <= 1;
            ALUOp <= 8;
            MemWr <= 0;
            MemRd <= 0;
            case (con_flags)
                4'B0000:begin
                    PCSrc = ~N[1];
                end
                4'B0001:begin
                    PCSrc = N[1];
                end
                4'B1011:begin
                    PCSrc = ~N[0];
                end
                4'B1101:begin
                    if(N[0]==0 || N[1]==0)
                        PCSrc = 0;
                    else
                        PCSrc = 1;
                end
                4'B1100:begin
                    PCSrc = N[0];
                end
                4'B1010:begin
                    if(N[0]==1 || N[1]==0)
                        PCSrc = 0;
                    else
                        PCSrc = 1;
                end
            endcase
            WrDataSel <= 1;
            RfWrScr <= 0;
            //flagsWR <=1;
        end 
        
        //CBZ
    else if(Inst[10:3] == 8'B10110100)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 3;
            ALUSrcB <= 1;
            ALUOp <= 8;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= ~Z;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //CBNZ
    else if(Inst[10:3] == 8'B10110101)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 3;
            ALUSrcB <= 1;
            ALUOp <= 8;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= Z;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
        //BL
    else if(Inst[10:5] == 6'B100101)
        begin
            RegRd2Src <= 1;
            RfWr <= 1;
            SEU <= 2;
            ALUSrcB <= 1;
            ALUOp <= 8;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 1;
            WrDataSel <= 2;
            RfWrScr <= 1;
        end 
        
        //B
    else if(Inst[10:5] == 6'B000101)
        begin
            RegRd2Src <= 1;
            RfWr <= 0;
            SEU <= 2;
            ALUSrcB <= 1;
            ALUOp <= 8;
            MemWr <= 0;
            MemRd <= 0;
            PCSrc <= 1;
            WrDataSel <= 1;
            RfWrScr <= 0;
        end 
        
end


endmodule
