function [ adj, t1_ij ] = hexagon_adjacency ( )

%*****************************************************************************80
%
%% hexagon_adjacency() returns adjacency information for a hexagon object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2021
%
%  Author:
%
%    John Burkardt
%
%  Output:
%
%    integer ADJ(36,3): ADJ(I,J) describes the J-th neighbor of the 
%    I-th 30-60-90 triangle.  Neighbor J=1 is across from the 30 degree angle,
%    J=2 from the 60 degree angle, and J=3 from the 90 degree angle.
%
%    integer t1_ij(3,2), the (i,j) vertex coordinates of the nodes of
%    triangle #1.  The nodes must be listed in the order 30, 60, 90.
%
  adj = [ ...
     2, -1,  6; ... % 1
     1, -1,  3; ... % 2
     4, 12,  2; ... % 3
     3, 11,  5; ... % 4
     6, 34,  4; ... % 5
     5, 33,  1; ... % 6

     8, -1, 12; ... % 7
     7, -1,  9; ... % 8
    10, 18,  8; ... % 9
     9, 17, 11; ... % 10
    12,  4, 10; ... % 11
    11,  3,  7; ... % 12

    14, -1, 18; ... % 13
    13, -1, 15; ... % 14
    16, 24, 14; ... % 15
    15, 23, 17; ... % 16
    18, 10, 16; ... % 17
    17,  9, 13; ... % 18

    20, -1, 24; ... % 19
    19, -1, 21; ... % 20
    22, 30, 20; ... % 21
    21, 29, 23; ... % 22
    24, 16, 22; ... % 23
    23, 15, 19; ... % 24

    26, -1, 30; ... % 25
    25, -1, 27; ... % 26
    28, 36, 26; ... % 27
    27, 35, 29; ... % 28
    30, 22, 28; ... % 29
    29, 21, 25; ... % 30

    32, -1, 36; ... % 31
    31, -1, 33; ... % 32
    34,  6, 32; ... % 33
    33,  5, 35; ... % 34
    36, 28, 34; ... % 35
    35, 27, 31  ... % 36
  ];

  t1_ij = [ ...
    0, 0; ...
    2, 2; ...
    2, 0 ];

  return
end

