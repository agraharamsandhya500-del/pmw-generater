`timescale 1ns/1ps

module pwm_generator_tb;

    reg clk;
    reg reset;
    reg [7:0] duty_cycle;
    wire pwm_out;

    pwm_generator uut (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        duty_cycle = 0;

        #20;
        reset = 0;

        // 25% duty cycle
        duty_cycle = 8'd64;
        #2560;

        // 50% duty cycle
        duty_cycle = 8'd128;
        #2560;

        // 75% duty cycle
        duty_cycle = 8'd192;
        #2560;

        // 100% duty cycle
        duty_cycle = 8'd255;
        #2560;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Duty Cycle=%0d | PWM=%b",
                  $time, duty_cycle, pwm_out);
    end

endmodule