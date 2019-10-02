`define cycle           1000
`define cycle_duty      `cycle/2
`define max_cycle_count 10000
`timescale              1ns/1ns


// module declare

module  decorder_tb;

    reg[3:0]        OP_CODE;
    reg             C_FLAG;
    wire[3:0]       LOAD;
    wire            SEL_A;
    wire            SEL_B;

// Design set

    DECORDER DECORDER(
        .OP_CODE(OP_CODE),
        .C_FLAG(C_FLAG),
        .LOAD(LOAD),
        .SEL_A(SEL_A),
        .SEL_B(SEL_B)
    );

// cycle set
    event       cycle_event;
    integer     cycle_count;

    initial
        begin
            ->  cycle_event;
            #1;
            cycle_count = 0;
        end
    
    always
        begin
            #(`cycle)
            ->  cycle_event;
        end
    
    always @(cycle_event)
        begin
            cycle_count <= cycle_count + 1;
                if  (cycle_count % 1000 == 0) begin
                    $display ("%d cycle", cycle_count);
                end
        end

// test
    integer i;

    initial
        begin
            #(`cycle);
            OP_CODE = 2'b1110;
            #(`cycle * 10);
            C_FLAG  = 2'b0;
            #(`cycle);
            C_FLAG  = 2'b1;
            #(`cycle);
            OP_CODE = 2'b0000;
            #(`cycle * 10);
            
            for ( i=0; i<15; i=i+1) begin
                OP_CODE <= OP_CODE + 2'b0001;
                #(`cycle);
            end

            #`max_cycle_count;
            $stop;
        end
endmodule

