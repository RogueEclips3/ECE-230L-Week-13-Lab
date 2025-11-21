module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    onehot onehot_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .states(led[6:2]),
        .z(led[0])
    );

    binary binary_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .state(led[9:7]),
        .out(led[1])
    );

endmodule