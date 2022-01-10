module ALU_tb;
     reg clk,enable,rst;
     reg [1:0] ALU_opcode;
     reg [15:0] data_A_bus,data_B_bus;

     wire z = 1'd0;
     wire [15:0] data_C_bus;


     parameter clk_period = 10;

     ALU alu_1(clk,enable,rst,ALU_opcode,data_A_bus,data_B_bus,z,data_C_bus);
    initial begin
       clk = 0;
    end
     
     always 
       #(clk_period/2) clk = ~clk;


     initial
         begin
            rst = 0; enable = 0; data_A_bus = 16'd6304; data_B_bus = 16'd1843;
            #(clk_period*5)

            enable = 1;
            #clk_period

            ALU_opcode = 2'd0;
            #clk_period

            ALU_opcode = 2'd1;
            #clk_period

            rst = 1;
            #clk_period

            rst = 0; data_A_bus = 16'd45; data_B_bus = 16'd20; ALU_opcode = 2'd2;
            #clk_period

            data_A_bus = 16'd45; data_B_bus = 16'd45; ALU_opcode = 2'd1;
            #clk_period

            rst = 1;
        end 
endmodule
     
