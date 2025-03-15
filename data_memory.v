module data_memory(
    input clk,
    input [7:0] address,
    input [7:0] write_data,
    input mem_read, mem_write,
    output reg [7:0] read_data
);
    reg [7:0] mem [0:255];
    always @(posedge clk) begin
        if (mem_write)
            mem[address] <= write_data;
    end
    always @(*) begin
        if (mem_read)
            read_data = mem[address];
        else
            read_data = 0;
    end
endmodule