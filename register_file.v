`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:06:35
// Design Name: 
// Module Name: register_file
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


module registerfile #(
    parameter data_width = 32,
    parameter num_reg = 32,
    parameter addr_width = 5
)
(
    input writeenable,
    input clk,
    input reset,

    input [addr_width-1:0] read_address1,
    input [addr_width-1:0] read_address2,
    input [addr_width-1:0] write_address,
    input [data_width-1:0] write_data,

    output [data_width-1:0] read_data1,
    output [data_width-1:0] read_data2
);

    reg [data_width-1:0] reg_file [0:num_reg-1];

    integer i;

    always @(posedge clk)
    begin
        if (reset)
        begin
            for (i = 0; i < num_reg; i = i + 1)
                reg_file[i] <= 0;
        end
        else if (writeenable && write_address != 0)
        begin
            reg_file[write_address] <= write_data;
        end
    end

    assign read_data1 = reg_file[read_address1];
    assign read_data2 = reg_file[read_address2];

endmodule
