module Instruction_register_tb;
     reg clk,write,rst;
     reg [16:0] data_in;

     wire[16:0] data_out;

     parameter clk_period = 10;

    Instruction_register ir_1(clk,write,rst,data_in,data_out);
    initial begin
       clk = 0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


     initial
         begin
            rst = 0; write = 0;
            #(clk_period)

            data_in  =16'b00100100; write = 1;
            #clk_period

            data_in  =16'b11100101; write = 0;
            #clk_period

            rst = 1;
        end 
endmodule
     