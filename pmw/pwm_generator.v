module pwm_generator #(
    parameter COUNTER_WIDTH = 8
)(
    input  wire clk,
    input  wire reset,
    input  wire [COUNTER_WIDTH-1:0] duty_cycle,
    output wire pwm_out
);

    reg [COUNTER_WIDTH-1:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 0;
        else
            counter <= counter + 1'b1;
    end

    assign pwm_out = (counter < duty_cycle);

endmodule