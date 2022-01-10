module Program_counter_tb;
     reg clk,write,rst,inc;
     reg [15:0] data_in;

     wire[15:0] data_out;

     parameter clk_period = 10;

     Program_counter pc_1(clk,write,rst,inc,data_in,data_out);
    initial begin
       clk = 0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


     initial
         begin
            rst = 0; write = 0; inc = 0;
            #(clk_period*5)

            inc = 1;
            #(clk_period*5)

            data_in  =8'b00100100; write = 1; inc = 0;
            #clk_period

            data_in  =8'b11100101; write = 0;
            #clk_period

            inc = 1;
            #clk_period

            inc = 0;
            #clk_period

            inc = 1;
            #clk_period

            rst = 1;
        end 
endmodule
     
