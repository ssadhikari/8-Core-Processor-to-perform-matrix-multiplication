module Accumilator_tb;
     reg clk,write,rst;
     reg [15:0] data_in;

     wire[15:0] data_out;

     parameter clk_period = 10;

     Accumilator ac_1(clk,write,rst,data_in,data_out);
    initial begin
       clk = 0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


     initial
         begin
            rst = 0; write = 0;
            #(clk_period*5)

            data_in  =16'b0010010001000101; write = 1;
            #clk_period

            data_in  =16'b1110010111000101; write = 0;
            #clk_period

            rst = 1;
        end 
endmodule
     