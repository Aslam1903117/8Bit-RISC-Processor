module top_module(
    input clk,
    input reset
);
    wire [7:0] current_pc, next_pc, jump_addr, read_data1, read_data2, alu_result, mem_data, write_data;
    wire [15:0] instruction;
    wire reg_write, mem_read, mem_write, jump;
    wire [1:0] alu_op;

    // Instantiate modules
    pc pc_inst (.clk(clk), .reset(reset), .jump(jump), .jump_addr(instruction[7:0]), .current_pc(current_pc));
    instruction_memory imem (.pc(current_pc), .instruction(instruction));
    control_unit cu (.opcode(instruction[15:12]), .reg_write(reg_write), .mem_read(mem_read), 
                     .mem_write(mem_write), .jump(jump), .alu_op(alu_op));
    register_file rf (
        .clk(clk),
        .write_enable(reg_write),
        .read_reg1(instruction[9:8]), // Src1
        .read_reg2(instruction[7:6]), // Src2
        .write_reg(instruction[11:10]), // Dest
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );
    alu alu_inst (.operand1(read_data1), .operand2(read_data2), .alu_op(alu_op), .result(alu_result));
    data_memory dmem (
        .clk(clk),
        .address(instruction[7:0]),
        .write_data(read_data1),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .read_data(mem_data)
    );

    // Mux for write data
    assign write_data = (instruction[15:12] == 4'b0011) ? instruction[7:0] : // LOAD
                        (instruction[15:12] == 4'b0100) ? mem_data : // STORE (not used)
                        alu_result; // ADD/SUB
    assign next_pc = jump ? instruction[7:0] : current_pc + 1;
endmodule