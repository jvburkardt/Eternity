function e_xy = hexagon_edge_xy ( )

%*****************************************************************************80
%
%% hexagon_edge_xy(): (x,y) coordinates of edge nodes of a hexagon object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Output:
%
%    real E_XY(12,2): the (x,y) coordinates of the edge nodes.
%
  s = sqrt ( 3.0 ) / 2.0;
  t = sqrt ( 3.0 ) / 4.0;

  e_xy = ...
  [ ...
      1.0,   0.0; ... % A
      0.75,  t;   ... % B
      0.5,   s;   ... % C
      0.0,   s;   ... % D
     -0.5,   s;   ... % E
     -0.75,  t;   ... % F
     -1.0,   0.0; ... % G
     -0.75, -t;   ... % H
     -0.5,  -s;   ... % I
      0.0,  -s;   ... % J
      0.5,  -s;   ... % K 
      0.75, -t    ... % L
  ];

  return
end

