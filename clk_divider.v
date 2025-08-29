// clk_divider.v
module clk_divider
#(
    parameter integer DIV = 10 // Must be even
)(
    input  wire clk_in,
    input  wire rst,
    output reg  clk_out
);

    localparam integer TC = (DIV / 2) - 1; // Terminal count
    integer count;

    wire terminate = (count == TC);

    always @(posedge clk_in) begin
        if (rst) begin
            count   <= 0;
            clk_out <= 0;
        end else begin
            if (terminate) begin
                count   <= 0;
                clk_out <= ~clk_out;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
