module RegisterBlock(clk,reset,rs1,rs2,rd_data1,rd_data2,wrEn,ws,wr_data);
    input wrEn,clk,reset;
    input [4:0] rs1,rs2,ws;
    input [31:0] wr_data;
    output [31:0] rd_data1,rd_data2;

    reg [31:0] reg_array [31:0]; //32 registers with each 32 bit data storage
    integer i;

    initial begin
        reg_array[0] = 0;
        reg_array[1] = 4;
        reg_array[2] = 2;
        reg_array[3] = 7;
        reg_array[4] = 53;
        reg_array[5] = 5;
        reg_array[6] = 3;
        reg_array[7] = 6;
        reg_array[8] = 12;
        reg_array[9] = 83;
        reg_array[10] = 82;
        reg_array[11] = 72;
        reg_array[12] = 19;
        reg_array[13] = 47;
        reg_array[14] = 48;
        reg_array[15] = 95;
        reg_array[16] = 255;
        reg_array[17] = 83;
        reg_array[18] = 75;
        reg_array[19] = 96;
        reg_array[20] = 67;
        reg_array[21] = 14;
        reg_array[22] = 46;
        reg_array[23] = 17;
        reg_array[24] = 64;
        reg_array[25] = 32;
        reg_array[26] = 7;
        reg_array[27] = 43;
        reg_array[28] = 56;
        reg_array[29] = 30;
        reg_array[30] = 21;
        reg_array[31] = 10;
    end

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            
        end

        else if(wrEn) begin
            reg_array[ws] <= wr_data;  //synchronous write
        end
        
    end

    assign rd_data1 = reg_array[rs1];   
    assign rd_data2 = reg_array[rs2];

endmodule