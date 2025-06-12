module led_counter (
    input wire clk,               // 100 MHz clock from Y9
    input wire btn_ccw,          // N15: turn CCW
    input wire btn_cw,           // R18: turn CW
    output reg drv_dir,
    output reg drv_step,
    output reg drv_en,
    output reg drv_rst,
    output reg drv_ms1,
    output reg drv_ms2,
    output reg drv_ms3,
    output reg [7:0] led         // Feedback LEDs: step, dir, en, rst
);

    reg [23:0] clkdiv = 0;

    always @(posedge clk) begin
        clkdiv <= clkdiv + 1;

        // Pulse step when either button is pressed
        if (btn_ccw || btn_cw)
            drv_step <= clkdiv[19];  // ~95 Hz
        else
            drv_step <= 0;
    end

    always @(*) begin
        // hard wires
        drv_dir  = btn_cw;  // CW if R18, CCW if N15
        drv_en   = 0;       // Enable always (active low)
        drv_rst  = 1;       // Always active
        drv_ms1  = 0;       // Full step mode
        drv_ms2  = 0;
        drv_ms3  = 0;
        
        // Activity leds
        // Upper pins
        led[0] = drv_dir;
        led[1] = drv_step;
        led[2] = drv_rst;
        led[3] = 0; // future to be limit switch signal
        
        // Lower pins
        led[4] = drv_en;
        led[5] = drv_ms1;
        led[6] = drv_ms2;
        led[7] = drv_ms3;
        
    end
    
endmodule
