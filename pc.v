module pc(
    input clk,
    input reset,
    input jump,
    input [7:0] jump_addr,
    output reg [7:0] current_pc
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_pc <= 0;
        else if (jump)
            current_pc <= jump_addr;
        else
            current_pc <= current_pc + 1;
    end
endmodule