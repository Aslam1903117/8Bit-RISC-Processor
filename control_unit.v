module control_unit(
    input [3:0] opcode,
    output reg reg_write, mem_read, mem_write, jump,
    output reg [1:0] alu_op
);
    always @(*) begin
        reg_write = 0;
        mem_read = 0;
        mem_write = 0;
        jump = 0;
        alu_op = 0;
        case (opcode)
            4'b0001: begin // ADD
                reg_write = 1;
                alu_op = 2'b00;
            end
            4'b0010: begin // SUB
                reg_write = 1;
                alu_op = 2'b01;
            end
            4'b0011: begin // LOAD
                reg_write = 1;
                mem_read = 0; // Simplified, immediate load
            end
            4'b0100: begin // STORE
                mem_write = 1;
            end
            4'b0101: begin // JUMP
                jump = 1;
            end
        endcase
    end
endmodule