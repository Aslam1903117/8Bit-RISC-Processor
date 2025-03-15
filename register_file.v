module register_file(
    input clk,
    input write_enable,
    input [1:0] read_reg1, read_reg2, write_reg,
    input [7:0] write_data,
    output reg [7:0] read_data1, read_data2
);
    reg [7:0] registers [0:3]; // 4 registers (R0-R3)
    always @(posedge clk) begin
        if (write_enable)
            registers[write_reg] <= write_data;
    end
    always @(*) begin
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end
endmodule