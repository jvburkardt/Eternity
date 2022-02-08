function v = hexagon3_vertex_xy ( )

%*****************************************************************************80
%
%% hexagon3_vertex_xy() returns (x,y) coordinates of hexagon3 vertices.
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
%    real V(6,2): the (x,y) coordinates of the vertices.
%
  s = 3.0;
  t = s / 2.0;
  u = s * sqrt ( 3.0 ) / 2.0;

  v = ...
  [ ...
     -t,  -u;   ...
      t,  -u;   ...
      s,   0.0; ...
      t,   u;   ...
     -t,   u;   ...
     -s,   0.0  ...
  ];

  return
end

