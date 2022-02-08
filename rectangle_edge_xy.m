function e_xy = rectangle_edge_xy ( nx, ny, p_xy )

%*****************************************************************************80
%
%% rectangle_edge_xy() returns the edge nodes of an NX by NY rectangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 November 2021
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
%    real E_XY(EN,2): the (x,y) coordinates of the edge nodes.
%
  en = 4 * nx + 4 * ny;
  e_xy = zeros ( un, 2 );

  left = p_xy(1,1);
  right = p_xy(1,1) + ( 2 * nx ) * 0.5;
  bottom = p_xy(1,2);
  top = bottom + ny * sqrt ( 3.0 ) / 3.0 + ny * sqrt ( 3.0 ) / 6.0;

  x = linspace ( left, right, 2 * nx + 1 );
  y = linspace ( bottom, top, 3 * ny + 1 );

  i = 1 : 3 * ny + 1;
  j1 = find ( mod ( i - 1, 6 ) ~= 1 & mod ( i - 1, 6 ) ~= 5 );
  j2 = find ( mod ( i - 4, 6 ) ~= 1 & mod ( i - 4, 6 ) ~= 5 );
  y1 = y(j1);
  y2 = y(j2);

  e_xy(1:2*nx,1) = x(1:2*nx);
  e_xy(1:2*nx,2) = bottom;

  e_xy(2*nx+1:2*nx+2*ny,1) = right;
  e_xy(2*nx+1:2*nx+2*ny,2) = y1(1:2*ny);

  e_xy(2*nx+2*ny+1:2*nx+2*ny+2*nx,1) = x(2*nx+1:-1:2);
  e_xy(2*nx+2*ny+1:2*nx+2*ny+2*nx,2) = top;

  e_xy(2*nx+2*ny+2*nx+1:2*nx+2*ny+2*nx+2*ny,1) = left;
  e_xy(2*nx+2*ny+2*nx+1:2*nx+2*ny+2*nx+2*ny,2) = y1(2*ny+1:-1:2);

  return
end

