function tile_vertices_xy_tikz ( k )

%*****************************************************************************80
%
%% tile_vertices_xy_tikz() writes the tikz description of an eternity tile.
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
%    integer K: the ID of an eternity tile.
%
  p_xy = zeros ( 1, 2 );

  [ w, p_ij ] = eternity_tile_word ( k );

  p_xy(1,1) = p_ij(1,1) / 4.0;
  p_xy(1,2) = p_ij(1,2) * sqrt ( 3.0 ) / 12.0;

  v_xy = word_to_vertex_xy ( w, p_xy );

  vn = size ( v_xy, 1 );

  fprintf ( 1, '%% eternity tile %d\n', k );
  fprintf ( 1, '\\draw' );
  for vi = 1 : vn
    fprintf ( 1, ' (%f, %f) --', v_xy(vi,1:2) );
  end
  fprintf ( 1, ' cycle;\n' );

  return
end

