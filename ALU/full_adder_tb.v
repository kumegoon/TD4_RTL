`define cycle               1000
`define cycle_duty          `cycle/2
`define max_cycle_count     10000
`timescale                  1ns/1ns

// module declare

module full_adder_tb;

//wire and reg
    reg [1:0]       IN_Y;
    reg [1:0]       IN_DATA;
    reg [1:0]       CIN;
    wire [1:0]      CRR;
    wire            DATA;

// Design set

    FULL_ADDER FULL_ADDER(
        .IN_Y(IN_Y),
        .IN_DATA(IN_DATA),
        .CIN(CIN),
        .CRR(CRR),
        .DATA(DATA)
    );

// cycle set
    event       cycle_event;
    integer     cycle_count;

    initial
        begin
            -> cycle_event;
            #1;
            cycle_count = 0; 
        end

    always
        begin
            #(`cycle)
            -> cycle_event;
        end
    

    always @(cycle_event)
        begin 
            cycle_count <= cycle_count + 1;
                if (cycle_count % 1000 ==0) begin
                    $display ("%d cycle", cycle_count);
                end
        end

//test

    initial
        begin
            #(`cycle);
            IN_Y = 2'b00;
            IN_DATA = 2'b00;
            CIN = 2'b00;
            #(`cycle);
            IN_Y = 2'b01;
            #(`cycle);
            IN_DATA = 2'b01;
            #(`cycle);
            CIN = 2'b01;
            #(`cycle);
            IN_DATA = 2'b00;
            #(`cycle);
            IN_Y = 2'b00;

            #`max_cycle_count;
            $stop;
        end
endmodule


