module onehot(
    input w, clk, reset,
    output [4:0] states,
    output z
);

    wire Acurr, Bcurr, Ccurr, Dcurr, Ecurr;

    // Next state logic

    wire Bnext, Cnext, Dnext, Enext;

    assign Bnext = (Acurr || Dcurr || Ecurr) && ~w;
    assign Cnext = (Bcurr || Ccurr) && ~w;
    assign Dnext = (Acurr || Bcurr || Ccurr) && w;
    assign Enext = (Dcurr || Ecurr) && w;

    // D-FFs

    dff Adff(
        .Default(1'b1),
        .D(1'b0),
        .clk(clk),
        .reset(reset),
        .Q(Acurr)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .reset(reset),
        .Q(Bcurr)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .reset(reset),
        .Q(Ccurr)
    );

    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .reset(reset),
        .Q(Dcurr)
    );

    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .reset(reset),
        .Q(Ecurr)
    );

    // Output logic

    assign states = { Ecurr, Dcurr, Ccurr, Bcurr, Acurr };

    assign z = Ccurr || Ecurr;

endmodule