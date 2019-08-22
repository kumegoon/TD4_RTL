
`define cycle               1000
`define cycle_duty          `cycle/2
`define max_cycle_count     150000
`timescale                  1ns/1ns

// module declare

module register_tb;

// wire and reg set

    reg             CLK;
    reg             RST;
    reg [3:0]       LOAD;
    reg [3:0]       IN_DATA;
    wire [3:0]      OUT_A;
    wire [3:0]      OUT_B;
    wire [3:0]      OUT_LD;
    wire [3:0]      ADDRESS;

// Design set

    register register(
        

    )
