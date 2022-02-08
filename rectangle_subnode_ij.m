function s_ij = rectangle_subnode_ij ( nx, ny )

%*****************************************************************************80
%
%% rectangle_subnode_ij() returns the IJ subnode coordinates of an NX by NY rectangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2021
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
%    integer S_IJ(SN,2), the (i,j) coordinates of the subnodes.
%
  s_ij = zeros ( 0, 2 );

  x = 0 : 4 * nx;
  y = 0 : 6 * ny;
%
%  Column 0, 4, 8, 12, ...
%
  i1 = find ( mod ( y, 12 ) ~= 0 & mod ( y, 12 ) ~= 4 & ...
              mod ( y, 12 ) ~= 6 & mod ( y, 12 ) ~= 8 );
  y1 = ( y(i1) )';
  n1 = length ( y1 );
%
%  Columns 1, 3, 5, 7, 9, 11, ...
%
  i2 = find ( mod ( y, 12 ) ~= 3 & mod ( y, 12 ) ~= 9 );
  y2 = ( y(i2) )';
  n2 = length ( y2 );
%
%  Columns 2, 6, 10, ...
%
  i3 = find ( mod ( y, 12 ) ~= 0 & mod ( y, 12 ) ~= 2 & ...
              mod ( y, 12 ) ~= 6 & mod ( y, 12 ) ~= 10 );
  y3 = ( y(i3) )';
  n3 = length ( y3 );
%
%  Starting at lower left, append coordinates of each column.
%
  for i = 0 : 4 * nx

    if ( mod ( i, 4 ) == 0 )
      x1 = x(i+1) * ones ( n1, 1 );
      s_ij = [ s_ij; x1, y1 ];
    elseif ( mod ( i, 4 ) == 2 )
      x3 = x(i+1) * ones ( n3, 1 );
      s_ij = [ s_ij; x3, y3 ];
    else
      x2 = x(i+1) * ones ( n2, 1 );
      s_ij = [ s_ij; x2, y2 ];
    end

  end

  return
end

