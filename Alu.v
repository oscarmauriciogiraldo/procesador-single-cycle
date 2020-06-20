
module Alu(
    input signed[63:0] A,
    input signed[63:0] B,
    input [5:0] Shamp,
    input [3:0] Aluopt,
    output reg signed [63:0] AluRes,
    output reg Z,
    output reg [1:0] N
    //output N
    );
    
always @(*)begin
    case (Aluopt)
        0: AluRes <= A + B;
        1:begin
            AluRes <= A - B;
            if(AluRes < 0)
                N[0] <= 0;
            else if ((A - B) >= 0)
                N[0] <= 1;
              
            if(AluRes!=0)
                N[1]<=1;
             else if(AluRes==0)
                N[1]<=0;   
        end 
        2: AluRes <= A & B;
        3: AluRes <= A | B;
        4: AluRes <= ~(A & B);
        5: AluRes <= A ^ B;
        6: AluRes <= A << Shamp;
        //6: AluRes = A << 1;
        7: AluRes = A >> Shamp;
        //7: AluRes = A >> 1;
        8:begin
             AluRes <= B;
             if(B==0)
                Z<=0;
             else
                Z<=1;
         end
        
    endcase
end

endmodule