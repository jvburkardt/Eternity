function un = rectangle_node_count ( nx, ny )

%*****************************************************************************80
%
%% rectangle_node_count() counts the nodes in an NX by NY rectangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2021
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
%  Output:
%
%    integer UN, the number of nodes.
%
  un = 6 * nx * ny + 2 * nx + 2 * ny + 1;

  return
end

