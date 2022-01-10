module Accumilator
        (input clk,write,rst,
        input [15:0] data_in,
        output reg[15:0] data_out);

	always @(posedge clk or posedge rst)
           begin
                 if ( rst ) data_out <= 0;
                 else if ( write ) data_out <= data_in;  
           end

endmodule
           