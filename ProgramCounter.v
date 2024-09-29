module Program_Counter(clk, reset, PC_in, PC_out);
    input clk,reset;
    input [31:0] PC_in;
    output reg [31:0] PC_out;

    always@(posedge clk or posedge reset)
    begin
        if (reset) 
            PC_out <= 32'b0;
        else
            PC_out <= PC_in;
    end
endmodule


module PCplus4(fromPC,NextPC);
    input [31:0] fromPC;
    output [31:0] NextPC;

    assign NextPC = 4 + fromPC;

endmodule