module Instruction_memory_tb;
     reg clk,read;
     reg [15:0] address;

     wire[15:0] data_out;

     parameter clk_period = 10;

     Instruction_memory ins_mem1(clk,read,address,data_out);
    initial begin
       clk = 0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


     initial
         begin
            read = 1; address = 16'd0;
            #clk_period

            read = 1; address = 16'd12;
            #clk_period

            read = 0; address = 16'd23;
            #clk_period

            read = 1; address = 16'd7;
        


        end 
endmodule
