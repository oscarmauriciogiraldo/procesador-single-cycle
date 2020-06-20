module Data_memory(
    input [63:0] Address,
    input [63:0] Datawr,
    input MemWr,
    input MemRd,
    input clk,
    input [7:0]sch,
    output reg [7:0]led,
    output reg [63:0] DM
    
    );
    
    reg [7:0] dataMemori [400:0];
    /*localparam Archivo = "data_memory.mem";
    
    initial begin
        $display("Loading rom.");
        $readmemh(Archivo,dataMemori);
    end*/

    always @(posedge clk)begin
        if(MemWr  && Address[17:16] == 0)begin // Memoria
            dataMemori[Address+7] <= Datawr[63:56];
            dataMemori[Address+6] <= Datawr[55:48];
            dataMemori[Address+5] <= Datawr[47:40];
            dataMemori[Address+4] <= Datawr[39:32];
            dataMemori[Address+3] <= Datawr[31:24];
            dataMemori[Address+2] <= Datawr[23:16];
            dataMemori[Address+1] <= Datawr[15:8];
            dataMemori[Address] <= Datawr[7:0];
        end
        else if(MemWr  && Address[17:16] == 1)begin // Leds
            led <= Datawr[7:0];
        end
        
        /*if(Datawr < 400 && MemRd && Address[17:16] == 1)begin
            DM <= {{55{sch[7]}},sch};
        end*/

        if(Datawr < 400 && MemWr && Address[17:16] == 1)begin
            led <= Datawr[7:0];
        end
    end
             

    //  Area de Lectura
    always @(*) begin
        if (MemRd && Address[17:16] == 0) begin // Memoriao_dataRd <= {r_insMem[i_add+7],r_insMem[i_add+6],r_insMem[i_add+5],r_insMem[i_add+4],r_insMem[i_add+3],r_insMem[i_add+2],r_insMem[i_add+1],r_insMem[i_add]};
            DM <= {dataMemori[Address+7],dataMemori[Address+6],dataMemori[Address+5],dataMemori[Address+4],dataMemori[Address+3],dataMemori[Address+2],dataMemori[Address+1],dataMemori[Address]};
        end
        /*else if(MemRd && Address[17:16] == 1)begin // Leds
            DM<={{56{led[7]}},led};
        end
        else if(MemRd && Address[17:16] == 2)begin  // Switch
            DM <= {{56{sch[7]}},sch};
        end*/
        if(Datawr < 400 && MemRd && Address[17:16] == 1)begin
            led <= Datawr[7:0];
        end
    end
    

endmodule