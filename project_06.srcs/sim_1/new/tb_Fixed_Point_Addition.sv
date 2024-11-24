`timescale 1ns / 1ps

module tb_Fixed_Point_Addition;

    localparam n1 = 8;
    localparam n2 = 5;
    localparam m1 = 2;
    localparam m2 = 2;

    logic [n1+m1-1:0] a;
    logic [n2+m2-1:0] b;
    logic [(n1 > n2 ? n1 : n2) + (m1 > m2 ? m1 : m2) - 1 : 0] sum;

    Fixed_Point_Addition #(.n1(n1), .n2(n2), .m1(m1), .m2(m2)) point1 (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        a = 22.40 * (2 ** m1);
        b = 1.0 * (2 ** m2);
        #10;

        a = 0.5 * (2 ** m1);
        b = 22.000 * (2 ** m2);
        #10;

        a = 12.5324 * (2 ** m1);
        b = 5.55 * (2 ** m2);
        #10;

        $finish;
    end
endmodule

