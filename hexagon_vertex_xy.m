function v = hexagon_vertex_xy ( )

%*****************************************************************************80
%
%% hexagon_vertex_xy(): (x,y) coordinates of vertices of a hexagon object.
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
%    real V(6,2): the (x,y) coordinates of the vertices.
%
  s = sqrt ( 3.0 ) / 2.0;

  v = ...
  [ ...
     -0.5,  -s;   ...
      0.5,  -s;   ...
      1.0,   0.0; ...
      0.5,   s;   ...
     -0.5,   s;   ...
     -1.0,   0.0  ...
  ];

  return
end

