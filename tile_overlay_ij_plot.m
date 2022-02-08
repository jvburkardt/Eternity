function tile_overlay_ij_plot ( w, p_ij, tc )

%*****************************************************************************80
%
%% tile_overlay_ij_plot() overlays the image of a tile on a region plot.
%
%  Discussion:
%
%    A region has been plotted as a network of triangles, each outlined 
%    in black.
%
%    A tile is to be laid on the region, covering some of the triangles.
%
%    This function uses color to display the triangles corresponding
%    to this tile.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character W, the boundary word for the tile.
%
%    integer P_IJ(1,2), the IJ coordinates of the base point.
%
%    integer TC, an index that allows us to pick the color for this tile.
%
  node_number = false;
%
%  Retrieve the node coordinates.
%
  w_ij = node_ij ( w, p_ij );

  wn = size ( w_ij, 1 );
%
%  Retrieve the indices of the nodes making up each triangle.
%
  [ tk, tt, w2_ij ] = triangle_k ( w, p_ij );

  tn = size ( tk, 1 );

  hold ( 'on' );

  for ti = 1 : tn

    a = tk(ti,1);
    b = tk(ti,2);
    c = tk(ti,3);

    if ( a < 1 | b < 1 | c < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'tile_overlay_plot: Warning!\n' );
      fprintf ( 1, '  Illegal vertex indices in triangle %d\n', ti );
      fprintf ( 1, '  30=%d, 60=%d, 90=%d\n', a, b, c );
      continue;
    end

    x = [ w2_ij(a,1), w2_ij(b,1), w2_ij(c,1) ];
    y = [ w2_ij(a,2), w2_ij(b,2), w2_ij(c,2) ];
    rgb = color_rgb ( tc );
    fill ( x, y, rgb );

    if ( node_number )
      xc = ( w2_ij(a,1) + w2_ij(b,1) + w2_ij(c,1) ) / 3.0;
      yc = ( w2_ij(a,2) + w2_ij(b,2) + w2_ij(c,2) ) / 3.0;
      lc = sprintf ( '%d', ti );
      text ( xc, yc, lc, 'HorizontalAlignment', 'Center' );
    end

  end

  hold ( 'off' );

  grid ( 'on' );
  axis ( 'square' );

  return
end     

