module led (
    input sys_clk,          // clk input
    input sys_rst_n,        // reset input
    output reg [5:0] led    // 6 LEDS pin
);

reg [23:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        counter <= 24'd0;
        led <= 6'b111110;      // Set initial LED output to '111110'
    end else begin
        if (counter < 24'd1349_9999)       // 0.5s delay
            counter <= counter + 1'b1;
        else begin
            counter <= 24'd0;
            led <= {led[4:0], led[5]};     // Shift the LED bits left by one position on each cycle.
        end
    end
end

endmodule