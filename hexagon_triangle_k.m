function [ tk, tt ] = hexagon_triangle_k ( )

%*****************************************************************************80
%
%% hexagon_triangle_k(): nodes forming each triangle in a hexagon object.
%
%  Discussion:
%
%    There are 25 nodes in a hexagon object.  Each triangle can be
%    described by listing the indices of its three nodes.  In each triangle,
%    the nodes are listed as associated with the 30, 60, and 90 degree
%    vertices respectively.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 June 2021
%
%  Author:
%
%    John Burkardt
%
%  Output:
%
%    integer TK(TN,3): TK(I,J) indexes the J-th node of the I-th 
%    30-60-90 triangle.
%
%    integer TT(TN,1), the type of the triangle.
%    1 through 6 describes the rotation, and the sign describes the parity.
%
   A = 1;
   B = 2;
   C = 3;
   D = 4;
   E = 5;
   F = 6;
   G = 7;
   H = 8;
   I = 9;
   J = 10;
   K = 11;
   L = 12;
   M = 13;
   N = 14;
   O = 15;
   P = 16;
   Q = 17;
   R = 18;
   S = 19;
   T = 20;
   U = 21;
   V = 22;
   W = 23;
   X = 24;
   Z = 25;

  tk = ...
  [ ...
    A, N, M; ... %  1
    A, N, B; ... %  2
%
    C, N, B; ... %  3
    C, N, O; ... %  4
    C, P, O; ... %  5
    C, P, D; ... %  6
%
    E, P, D; ... %  7
    E, P, Q; ... %  8
    E, R, Q; ... %  9
    E, R, F; ... % 10
%
    G, R, F; ... % 11
    G, R, S; ... % 12
    G, T, S; ... % 13
    G, T, H; ... % 14
%
    I, T, H; ... % 15
    I, T, U; ... % 16
    I, V, U; ... % 17
    I, V, J; ... % 18
%
    K, V, J; ... % 19
    K, V, W; ... % 20
    K, X, W; ... % 21
    K, X, L; ... % 22
%
    A, X, L; ... % 23
    A, X, M; ... % 24
%
    Z, N, M; ... % 25
    Z, N, O; ... % 26
    Z, P, O; ... % 27
    Z, P, Q; ... % 28
    Z, R, Q; ... % 29
    Z, R, S; ... % 30
    Z, T, S; ... % 31
    Z, T, U; ... % 32
    Z, V, U; ... % 33
    Z, V, W; ... % 34
    Z, X, W; ... % 35
    Z, X, M  ... % 36
  ];

  tt = [ ...
    -4;  3; -2;  5; -3;  4; -1;  6; -2;  5; -6;  1; ... 
    -1;  6; -5;  2; -6;  1; -4;  3; -5;  2; -3;  4; ...
     1; -6;  2; -5;  3; -4;  4; -3;  5; -2;  6; -1 ];
                        
  return
end

