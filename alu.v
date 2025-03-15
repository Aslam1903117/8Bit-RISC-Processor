module alu(
    input [7:0] operand1, operand2,
    input [1:0] alu_op,
    output reg [7:0] result
);
    always @(*) begin
        case (alu_op)
            2'b00: result = operand1 + operand2; // ADD
            2'b01: result = operand1 - operand2; // SUB
            default: result = 0;
        endcase
    end
endmodule