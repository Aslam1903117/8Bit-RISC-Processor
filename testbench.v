`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg reset;
    
    top_module dut (
        .clk(clk),
        .reset(reset)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end
    
    // Reset and test sequence
    initial begin
        reset = 1;
        #15 reset = 0; // Reset for 15ns
        #60 $finish; // Run for 60ns
    end
    
    // Display for debugging
    initial begin
        $monitor("Time=%0t PC=%0d Instr=%b R1=%0d", $time, dut.current_pc, dut.instruction, dut.rf.registers[1]);
    end
endmodule