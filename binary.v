module binary(
    input w, clk, reset,
    output [2:0] state,
    output out
);

    wire Xcurr, Ycurr, Zcurr;

    // Next state logic

    wire Xnext, Ynext, Znext;

    assign Xnext = (Zcurr && ~w) || (Xcurr && Ycurr && ~w) || (~Xcurr && ~Zcurr && w)
                    || (~Xcurr && ~Ycurr && ~Zcurr) || (~Ycurr && ~Zcurr && w);
    assign Ynext = (Xcurr && ~Ycurr) || (~Xcurr && Ycurr) || (~Xcurr && ~Zcurr && w);
    assign Znext = (Zcurr && w) || (Xcurr && Ycurr && w);

    // D-FFs

    dff Xdff(
        .Default(1'b0),
        .D(Xnext),
        .clk(clk),
        .reset(reset),
        .Q(Xcurr)
    );

    dff Ydff(
        .Default(1'b0),
        .D(Ynext),
        .clk(clk),
        .reset(reset),
        .Q(Ycurr)
    );

    dff Zdff(
        .Default(1'b0),
        .D(Znext),
        .clk(clk),
        .reset(reset),
        .Q(Zcurr)
    );

    // Output

    assign state = { Zcurr, Ycurr, Xcurr };

    assign out = state == 3'b010 || state == 3'b100;

endmodule