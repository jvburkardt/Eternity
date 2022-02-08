function vertex_ij_print ( v_ij, label )

%*****************************************************************************80
%
%% vertex_ij_print() prints the vertices of an object.
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
%    integer V_IJ(VN,2), the (i,j) coordinates of the vertices.
%
%    character LABEL, a title for the plot.
%
  vn = size ( v_ij, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', label );
  fprintf ( 1, '\n' );
  for vi = 1 : vn
    fprintf ( 1, '  %2d  (%d,%d)\n', vi, v_ij(vi,1:2) );
  end

  return
end

