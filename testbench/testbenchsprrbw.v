`timescale 1ns / 1ps

module testbenchsprrbw #(parameter biti = 32);

    reg clk, we;
    reg [2:0] addr;
    reg [biti-1 : 0] d_in;
    wire [biti-1 : 0] d_out;
    integer i;

    spr_rbw #(biti) inst1(clk, we, addr, d_in, d_out);

    always #10 clk = ~clk;

    initial begin
        clk = 0; we = 0;
        d_in = {biti{1'bx}};
        addr = 3'bx;
        
        for (i=0; i<8; i=i+1)
        begin
            @(negedge clk);
            #5 addr = i; we = 1; d_in = 15 - i;
        end
        
        @(negedge clk);
        for (i=0; i<8; i=i+1)
        begin
            @(negedge clk);
            #5 addr = i; we = 0;
        end
        
        
        @(negedge clk);
        #5 addr = 5; we = 1; d_in = 200;
        
        @(negedge clk);
        addr = 3'bx; we = 1'bx; d_in = {biti{1'bx}};
        
        @(negedge clk);
        $finish;
    end

endmodule
