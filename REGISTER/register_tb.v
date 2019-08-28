
`define cycle               1000
`define cycle_duty          `cycle/2
`define max_cycle_count     150000
`timescale                  1ns/1ns

// module declare

module register_tb;

// wire and reg set

    reg             I_CLK;
    reg             RST;
    reg [3:0]       LOAD;
    reg [3:0]       IN_DATA;
    wire [3:0]      OUT_A;
    wire [3:0]      OUT_B;
    wire [3:0]      OUT_LD;
    wire [3:0]      ADDRESS;

// Design set

    register_4bit register_4bit(
        .CLK(I_CLK),
        .RST(RST),
        .LOAD(LOAD),
        .IN_DATA(IN_DATA),
        .OUT_A(OUT_A),
        .OUT_B(OUT_B),
        .OUT_LD(OUT_LD),
        .ADDRESS(ADDRESS)
        );        

//cycle set
    event   cycle_event;
    integer cycle_count;

    initial
        begin
            -> cycle_event;
            #1;
            cycle_count = 0 ;
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

    always @( cycle_event )
        begin
            cycle_count <= cycle_count + 1;
                if (cycle_count % 1000 == 0) begin
                    $display ( "%d cycle" , cycle_count);
                end
        end

// test

    initial
        begin
            #(`cycle);
            RST = 1'b1;
            #(`cycle);
            RST = 1'b0;

            #(`cycle);
            IN_DATA = 4'b1010;
            #(`cycle);
            LOAD = 4'b1110;
            #(`cycle);
            LOAD = 4'b1101;

            #(`cycle);
            RST <= 1'b1;
            #(`cycle);
            RST <= 1'b0;

            IN_DATA <= 4'b1100;
            #(`cycle);
            LOAD <= 4'b1011;
            #(`cycle);
            LOAD <= 4'b0111;

            #`max_cycle_count;
            $stop;
        end
endmodule
