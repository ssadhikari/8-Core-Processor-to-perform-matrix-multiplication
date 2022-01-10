module ALU
        (input clk,rst,
        input [1:0] ALU_opcode,
        input [15:0] data_A_bus,data_B_bus,
        output reg z = 1'd0,
        output reg[15:0] data_C_bus);

	always @(posedge clk or posedge rst)
           begin
                 if ( rst ) data_C_bus <= 0;
                 else
                     begin
                         case(ALU_opcode)
                             2'd1 : data_C_bus <= data_A_bus + data_B_bus ;
                             2'd2 : begin
                                      data_C_bus = data_A_bus - data_B_bus ;  
					if ((data_C_bus[15])==1) z <=1;
					else z <=0;
                                      //negative value 10000000000010
                                    end          
                             2'd3 : data_C_bus <= data_A_bus * data_B_bus ;
                             default: data_C_bus <= data_A_bus ;
                        endcase 
                    end
           end
endmodule
           
