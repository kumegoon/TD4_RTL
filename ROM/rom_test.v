// CLK define

`define cycle          1000
`define cycle_duty      `cycle/2 
`define max_cycle_count	1500000

`timescale              1ns/1ns

// module declare

module top_rom_test;

// Wire and Reg set

    reg [3:0]    ADDRESS;
    wire [3:0]   ROM_DATA;
    wire [3:0]   OP_CODE;

// Design set

    rom_16byte rom_16byte(
        .ADDRESS(ADDRESS),
        .ROM_DATA(ROM_DATA),
        .OP_CODE(OP_CODE)
        );

// cycle set

    event   cycle_event;
    integer cycle_count;

    initial
        begin
            -> cycle_event;
            #1;
            cycle_count = 0;
        end
    
    always
        begin
            #(`cycle);
            -> cycle_event;
        end

    always @( cycle_event )
        begin
            cycle_count <= cycle_count + 1;
                if (cycle_count % 1000 == 0) begin
                    $display ( "%d cycle", cycle_count);       
                end
        end

// test

    initial
        begin
            #(`cycle);
            ADDRESS = 4'b0000;
            #(`cycle);
            ADDRESS = 4'b0001;
            #(`cycle);
            ADDRESS = 4'b0010;
            #(`cycle);
            ADDRESS = 4'b0011;
            #(`cycle);
            ADDRESS = 4'b0100;
            #(`cycle);
            ADDRESS = 4'b0101;
            #(`cycle);
            ADDRESS = 4'b0110;
            #(`cycle);
            ADDRESS = 4'b0111;
            #(`cycle);
            ADDRESS = 4'b1000;
            #(`cycle);
            ADDRESS = 4'b1001;
            #(`cycle);
            ADDRESS = 4'b1010;
            #(`cycle);
            ADDRESS = 4'b1011;
            #(`cycle);
            ADDRESS = 4'b1100;
            #(`cycle);
            ADDRESS = 4'b1101;
            #(`cycle);
            ADDRESS = 4'b1110;
            #(`cycle);
            ADDRESS = 4'b1111;            

            // max cycle
            
			#`max_cycle_count;
			$stop;
        end
endmodule