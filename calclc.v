`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2023 12:28:06 AM
// Design Name: 
// Module Name: calclc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calculator (
input  [3:0] dat_a_in,
input   [3:0] dat_b_in,
input  [1:0] function_in,
output   [7:0] out
);

reg [7:0] out_sum, out_sub , out_mult, out_div;

assign out = out_sum | out_sub | out_mult | out_div;

always@(dat_a_in or dat_b_in)
begin
    case (function_in)

        2'b00: begin
            out_sum <= dat_a_in + dat_b_in;
            out_sub <= 7'b0;
            out_mult <= 7'b0;
            out_div <= 7'b0;
         end
        2'b01: begin
            out_sub <= dat_a_in - dat_b_in;
            out_sum <= 7'b0;
            out_mult <= 7'b0;
            out_div <= 7'b0;

        end
        2'b10: begin
            out_mult <= dat_a_in * dat_b_in;
            out_sum <= 7'b0;
            out_sub <= 7'b0;
            out_div <= 7'b0;
        end
        default: begin
            out_div <= dat_a_in / dat_b_in;
            out_sum <= 7'b0;
            out_sub <= 7'b0;
            out_mult <= 7'b0;
        end

    endcase
end
endmodule