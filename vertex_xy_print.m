function vertex_xy_print ( v_xy, label )

%*****************************************************************************80
%
%% vertex_xy_print() prints the vertices of an object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    real V_XY(VN,2), the (x,y) coordinates of the vertices.
%
%    character LABEL, a title for the plot.
%
  vn = size ( v_xy, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', label );
  fprintf ( 1, '\n' );
  for vi = 1 : vn
    fprintf ( 1, '  %2d  (%f,%f)\n', vi, v_xy(vi,1:2) );
  end

  return
end

