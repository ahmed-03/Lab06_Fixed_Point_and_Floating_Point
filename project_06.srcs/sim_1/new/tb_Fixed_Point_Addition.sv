`timescale 1ns / 1ps

module tb_Fixed_Point_Addition;

    localparam n1 = 2;
    localparam n2 = 3;
    localparam m1 = 3;
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
        a = 11.002;
        b = 200.11;
        #10;

        a = 0.5;
        b = 22.000;
        #10;


        $finish;
    end
endmodule

