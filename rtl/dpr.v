`timescale 1ns / 1ps

module dpr #(parameter biti = 32) (
    input clk,
    input we_a, we_b,
    input [2:0] addr_a, addr_b,
    input [biti-1:0] d_in_a, d_in_b,
    output [biti-1:0] d_out_a, d_out_b
);

    reg [biti-1 : 0] ram_vec[7:0];
    
    reg [2:0] read_addr_a;
    reg [2:0] read_addr_b;

    always @(posedge clk)
    begin
        if (we_a)
            ram_vec[addr_a] <= d_in_a;
            
        read_addr_a <= addr_a;
    end

    always @(posedge clk)
    begin
        if (we_b)
            ram_vec[addr_b] <= d_in_b;
            
        read_addr_b <= addr_b;
    end

    assign d_out_a = ram_vec[read_addr_a];
    assign d_out_b = ram_vec[read_addr_b];

endmodule