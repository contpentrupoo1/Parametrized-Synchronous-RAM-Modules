`timescale 1ns / 1ps

module spr_rbw #(parameter biti = 32) (
    input clk, we,
    input [2:0] addr,
    input [biti-1:0] d_in,
    output [biti-1:0] d_out
);

    reg [biti-1 : 0] ram_vec[7:0];
    reg [biti-1 : 0] out_reg;

    always @(posedge clk)
    begin
        if (we)
            ram_vec[addr] <= d_in;
        
        out_reg <= ram_vec[addr];
    end

    assign d_out = out_reg;

endmodule
