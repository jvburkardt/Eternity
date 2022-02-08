function opp = hexagon_grid_line_edges ( )

%*****************************************************************************80
%
%% hexagon_grid_line_edges() indexes edge nodes that end hexagon grid lines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Output:
%
%    integer OPP(12,6): OPP(I,1:6) are the indices of the six edge 
%    nodes that are opposite to edge node I in the 0/180, 60/240, 
%    120/300, 90/270, 150/330, 210/30 degree directions.
%
  opp = zeros(12,6);

  opp = [ ...
    11,    3,    7,    9,  -1,   5; ... %  1
    -1,   -1,   -1,    8,  -1,  -1; ... %  2
     9,    1,    5,    7,  11,  -1; ... %  3
    -1,   -1,   -1,   -1,  10,  -1; ... %  4
     7,   11,    3,   -1,   9,   1; ... %  5
    -1,   -1,   -1,   -1,  -1,  12; ... %  6
     5,    9,    1,    3,  -1,  11; ... %  7
    -1,   -1,   -1,    2,  -1,  -1; ... %  8
     3,    7,   11,    1,   5,  -1; ... %  9
    -1,   -1,   -1,   -1,   4,  -1; ... % 10
     1,    5,    9,   -1,   3,   7; ... % 11
    -1,   -1,   -1,   -1,  -1,   6  ... % 12
  ];

  return
end

