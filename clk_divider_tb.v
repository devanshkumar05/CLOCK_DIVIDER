// clk_divider_tb.v
`timescale 1us / 1ns

module clk_divider_tb;

    // Inputs
    reg clk_in;
    reg rst;

    // Output
    wire clk_out;

    // Instantiate the Device Under Test (DUT)
    clk_divider #( .DIV(10) ) DUT (
        .clk_in  ( clk_in  ), // 1 kHz
        .rst     ( rst     ),
        .clk_out ( clk_out )  // 100 Hz
    );

    // Generate 1 kHz clock: 1 ms period = 500 us high, 500 us low
    initial clk_in = 0;
    always #500 clk_in = ~clk_in;

    // Stimulus block
    initial begin
        // Dump waveform
        $dumpfile("clk_divider.vcd");
        $dumpvars(0, clk_divider_tb);

        // Apply reset
        rst = 1;
        #2000; // Wait 2 ms
        rst = 0;

        // Let simulation run for 60 ms
        #60000;
        $finish;
    end

endmodule
