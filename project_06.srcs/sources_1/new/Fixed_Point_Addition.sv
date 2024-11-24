`timescale 1ns / 1ps

module Fixed_Point_Addition #(parameter n1 = 8, n2 = 5, m1=2, m2=2 )(
    input [n1+m1-1:0] a,
    input [n2+m2-1:0] b,
    output [(n1 > n2 ? n1 : n2) + (m1 > m2 ? m1 : m2) - 1 : 0] sum
    );
    
    localparam integer maxN = (n1 > n2) ? n1 : n2;
    localparam integer maxM = (m1 > m2) ? m1 : m2;
    
    assign sum = ( (m1 > m2) ? a+(b<<m1-m2) : b+(a<<m2-m1) );

endmodule
