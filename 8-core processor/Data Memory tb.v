module Data_memory_tb;

     reg clk,read,write;
     reg [15:0] address,data_in;

     wire[15:0] data_out;
     wire [15:0] word[255:0];

     parameter clk_period = 10;

     Data_memory data_mem1(clk,write,read,address,data_in,data_out,word);
    initial begin
       clk = 0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


     initial
         begin
            read = 1; address = 16'd0;
            #clk_period

            read = 1; address = 16'd10;
            #clk_period

            read = 0; address = 16'd9;
            #clk_period

            read = 1; address = 16'd7;
	    #clk_period

            read = 0;write = 1; address = 16'd14; data_in = 16'd23;
            #clk_period

            write = 1; address = 16'd15; data_in = 16'd2;
            #clk_period

            write = 0; address = 16'd17; data_in = 16'd3;
        


        end 
endmodule
