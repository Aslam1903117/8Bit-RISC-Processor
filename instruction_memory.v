module instruction_memory(
    input [7:0] pc,
    output reg [15:0] instruction
);
    reg [15:0] mem [0:255];
    initial begin
        mem[0] = 16'b0011010100000101; // LOAD R1, 5
        mem[1] = 16'b0001010101010000; // ADD R1, R1, R1
        mem[2] = 16'b0100010100000010; // STORE R1, 2
        mem[3] = 16'b0000000000000000; // NOP (end)
    end
    always @(*) begin
        instruction = mem[pc];
    end
endmodule