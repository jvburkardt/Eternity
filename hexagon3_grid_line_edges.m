function opp = hexagon3_grid_line_edges ( )

%*****************************************************************************80
%
%% hexagon3_grid_line_edges() indexes edge nodes that end hexagon3 grid lines.
%
%  Discussion:
%
%    The 6 edges of the serenity grid include 36 edge nodes.
%    Each edge comprises 7 nodes (2 endpoints and 5 interior).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2020
%
%  Author:
%
%    John Burkardt
%
%  Output:
%
%    integer OPP(36,6): OPP(I,1:6) are the indices of the six edge 
%    nodes that are opposite to edge node I in the 0/180, 60/240, 
%    120/300, 90/270, 150/330, 210/30 degree directions.
%
  opp = zeros(36,6);

  opp = [ ...
    19,   31,    7,   -1,   13,   25; ... %  1
    -1,   -1,   -1,   -1,   -1,   24; ... %  2
    17,   29,   -1,   35,   11,   23; ... %  3
    -1,   -1,   -1,   -1,   -1,   22; ... %  4
    15,   27,   -1,   33,    9,   21; ... %  5
    -1,   -1,   -1,   -1,   -1,   20; ... %  6
    13,   25,    1,   31,   -1,   19; ... %  7
    -1,   -1,   -1,   30,   -1,   -1; ... %  8
    -1,   23,   35,   29,    5,   17; ... %  9
    -1,   -1,   -1,   28,   -1,   -1; ... % 10
    -1,   21,   33,   27,    3,   15; ... % 11
    -1,   -1,   -1,   26,   -1,   -1; ... % 12
     7,   19,   31,   25,    1,   -1; ... % 13
    -1,   -1,   -1,   -1,   36,   -1; ... % 14
     5,   -1,   29,   23,   35,   11; ... % 15
    -1,   -1,   -1,   -1,   34,   -1; ... % 16
     3,   -1,   27,   21,   33,    9; ... % 17
    -1,   -1,   -1,   -1,   32,   -1; ... % 18
     1,   13,   25,   -1,   31,    7; ... % 19
    -1,   -1,   -1,   -1,   -1,    6; ... % 20
    35,   11,   -1,   17,   29,    5; ... % 21
    -1,   -1,   -1,   -1,   -1,    4; ... % 22
    33,    9,   -1,   15,   27,    3; ... % 23
    -1,   -1,   -1,   -1,   -1,    2; ... % 24
    31,    7,   19,   13,   -1,    1; ... % 25
    -1,   -1,   -1,   12,   -1,   -1; ... % 26
    -1,    5,   17,   11,   23,   35; ... % 27
    -1,   -1,   -1,   10,   -1,   -1; ... % 28
    -1,    3,   15,    9,   21,   33; ... % 29
    -1,   -1,   -1,    8,   -1,   -1; ... % 30
    25,    1,   13,    7,   19,   -1; ... % 31
    -1,   -1,   -1,   -1,   18,   -1; ... % 32
    23,   -1,   11,    5,   17,   29; ... % 33
    -1,   -1,   -1,   -1,   16,   -1; ... % 34
    21,   -1,    9,    3,   15,   27; ... % 35
    -1,   -1,   -1,   -1,   14,   -1  ... % 36
  ];

  return
end

