`include "Top.v"

module tb_top;

reg clk, reset;
top uut(.clk(clk), .reset(reset));

initial begin   
    clk = 0;
    reset = 1;

    #5 reset = 0;
    #500;
end

always begin
    #10 clk = ~clk;
end

endmodule