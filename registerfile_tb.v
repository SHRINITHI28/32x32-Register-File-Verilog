`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:09:24
// Design Name: 
// Module Name: registerfile_tb
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


`timescale 1ns / 1ps

module registerfile_tb;

parameter DATA_WIDTH = 32;
parameter NUM_REG = 32;
parameter ADDR_WIDTH = 5;

reg clk;
reg reset;
reg writeenable;

reg [ADDR_WIDTH-1:0] read_address1;
reg [ADDR_WIDTH-1:0] read_address2;
reg [ADDR_WIDTH-1:0] write_address;
reg [DATA_WIDTH-1:0] write_data;

wire [DATA_WIDTH-1:0] read_data1;
wire [DATA_WIDTH-1:0] read_data2;

// DUT
registerfile #(
    .data_width(DATA_WIDTH),
    .num_reg(NUM_REG),
    .addr_width(ADDR_WIDTH)
) uut (
    .writeenable(writeenable),
    .clk(clk),
    .reset(reset),
    .read_address1(read_address1),
    .read_address2(read_address2),
    .write_address(write_address),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// Clock Generation
always #5 clk = ~clk;

// Monitor
initial
begin
    $monitor("Time=%0t | WE=%b | WA=%d | WD=%d | RA1=%d RD1=%d | RA2=%d RD2=%d",
              $time,
              writeenable,
              write_address,
              write_data,
              read_address1,
              read_data1,
              read_address2,
              read_data2);
end

// Test Sequence
initial
begin

    clk = 0;
    reset = 1;
    writeenable = 0;
    write_address = 0;
    write_data = 0;
    read_address1 = 0;
    read_address2 = 0;

    #12;
    reset = 0;

    // Write 100 to Register 6
    writeenable = 1;
    write_address = 6;
    write_data = 100;
    #10;

    writeenable = 0;
    read_address1 = 6;
    #10;

    // Write 250 to Register 9
    writeenable = 1;
    write_address = 9;
    write_data = 250;
    #10;

    writeenable = 0;
    read_address2 = 9;
    #20;

    // Try writing to Register 0
    writeenable = 1;
    write_address = 0;
    write_data = 999;
    #10;

    writeenable = 0;
    read_address1 = 0;
    #10;

    // Write disabled
    writeenable = 0;
    write_address = 15;
    write_data = 777;
    #10;

    read_address1 = 15;
    #10;

    $display(" Register File Test Completed");

    $finish;

end

endmodule
