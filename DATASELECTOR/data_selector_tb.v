`define cycle               1000
`define cycle_duty          `cycle/2
`define max_cycle_count     150000
`timescale                  1ns/1ns

// module declare

module data_selector_tb;

// wire and reg set

    reg [3:0]       IN_A;
    reg [3:0]       IN_B;
    reg [3:0]       IN_SW;
    reg             SEL_A;
    reg             SEL_B;
    wire [3:0]      OUT_Y

// Design set

    DATA_SELECTOR DATA_SELECTOR(
        .IN_A(IN_A),
        .IN_B(IN_B),
        .IN_SW(IN_SW),
        .SEL_A(SEL_A),
        .SEL_B(SEL_B),
        .OUT_Y(OUT_Y)
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
                if ( cycle_count % 1000 == 0) begin
                    $display ( "%d cycle" , cycle_count );
        end

    always
        begin
            #(`cycle/2);
            I_CLK = 0;
            #(`cycle/2);
            I_CLK = 1;
        end
    
// test

    