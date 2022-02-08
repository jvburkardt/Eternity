function v = rectangle_vertex_xy ( nx, ny, p_xy )

%*****************************************************************************80
%
%% rectangle_vertex_xy(): (x,y) coordinates of vertices of a rectangle grid.
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
%  Input:
%
%    integer NX, the width of the grid, in equilateral triangles.
%
%    integer NY, the height of the grid, in equilateral triangles.
%
%    real P_XY(1,2), the (x,y) coordinates of the lower left node.
%
%  Output:
%
%    real V(4,2): the (x,y) coordinates of the vertices.
%
  left = p_xy(1,1);
  right = p_xy(1,1) + ( 2 * nx ) * 0.5;
  bottom = p_xy(1,2);
  top = bottom + ny * sqrt ( 3.0 ) / 3.0 + ny * sqrt ( 3.0 ) / 6.0;

  v = ...
  [ ...
      left,  bottom;
      right, bottom;
      right, top;
      left,  top
  ];

  return
end

