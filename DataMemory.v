module DataMemory(clk, reset, MemWrite, MemRead, Mem_Addr, wr_data, rd_data);
    input clk,reset,MemRead,MemWrite;
    input [31:0] wr_data, Mem_Addr;
    output [31:0] rd_data; //this should not be reg because we don't want continuous assignment
    integer k;

    reg [31:0] memory [63:0];

    always@(posedge clk)
    begin
        //According to the sample instructions
        memory[20] = 69;
        memory[10] = 77;
        memory[19] = 1;
    end

    always@(posedge clk or posedge reset)
    begin
        if(reset) begin
            for(k=0;k<64;k=k+1)
                memory[k] <= 32'b0;
        end
        else if(MemWrite) begin
            memory[Mem_Addr] <= wr_data;
        end
    end

    assign rd_data = (MemRead) ? memory[Mem_Addr] : 32'b00;

endmodule