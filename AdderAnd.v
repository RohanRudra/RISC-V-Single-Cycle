module Adder(i1,i2,sum);
    input [31:0] i1,i2;
    output [31:0] sum;

    assign sum = i1 + i2;
endmodule

module andGate(branch,zero,and_out);
    input branch,zero;
    output and_out;

    assign and_out = branch & zero;
endmodule