`define cycle               1000
`define cycle_duty          `cycle/2
`define max_cycle_count     15000000
`timescale                  1ns/1ns

// module declare

module chatter_filter_tb;

// wire and reg set
    reg        I_CLK;
    reg        RST;
    reg        SW_I;
    wire       SW_O;

// Design set

    CHATTER_FILTER CHATTER_FILTER(
        .CLK(I_CLK),
        .RST(RST),
        .SW_I(SW_I),
        .SW_O(SW_O)
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
    
    always
        begin
            #(`cycle/2);
            I_CLK = 0;
            #(`cycle/2);
            I_CLK = 1;
        end

    always @(cycle_event)
        begin
            cycle_count <= cycle_count + 1;
                if ( cycle_count % 1000 == 0) begin
                    $display ( "%d cycle" , cycle_count );
                end
        end

// test

    initial
        begin
            #(`cycle *10);
                RST = 1'b1;
            #(`cycle);
                RST = 1'b0;
                SW_I = 1'b1;
            #(`cycle*15);
                SW_I = 1'b0;
            #(`cycle*10);
                SW_I = 1'b1;
            #(`cycle*30);
                SW_I = 1'b0;
            #(`cycle*10001);
                SW_I = 1'b1;
            #(`cycle*1);
                SW_I = 1'b0;
            #(`cycle*10001);
                SW_I = 1'b1;
            #(`cycle*1);
                SW_I = 1'b0;
            #(`cycle*10001);
                SW_I = 1'b1;
            #`max_cycle_count;
            $stop;
        end
endmodule
    