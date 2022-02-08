function triangle_xy_plot ( w, p_ij, node_show, element_number, title_string, ...
  filename )

%*****************************************************************************80
%
%% triangle_xy_plot() plots triangles in an object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character W(WN), the boundary word.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%
%    logical NODE_SHOW, is TRUE if nodes and node numbers should be plotted.
%
%    logical ELEMENT_NUMBER, is TRUE if element numbers should be plotted.
%
%    character TITLE_STRING, a string to title the plot.
%
%    character FILENAME, the name of the file into which the plot is saved.
%
  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Retrieve the node coordinates.
%
  w_ij = node_ij ( w, p_ij );
  p_xy(1,1) = p_ij(1,1) * 0.25;
  p_xy(1,2) = p_ij(1,2) * sqrt ( 3.0 ) / 12.0;
  w_xy = node_ij_to_xy ( w_ij, p_xy );
  wn = size ( w_xy, 1 );
%
%  Retrieve the indices of the nodes making up each triangle.
%
  [ tk, tt, w2_ij ] = triangle_k ( w, p_ij );
  w2_xy = node_ij_to_xy ( w2_ij, p_xy );
  tn = size ( tk, 1 );
%
%  Draw the triangles within the shape.
%
  for ti = 1 : tn

    a = tk(ti,1);
    b = tk(ti,2);
    c = tk(ti,3);

    if ( a < 1 | b < 1 | c < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'triangle_xy_plot: Warning!\n' );
      fprintf ( 1, '  Illegal vertex indices in triangle %d\n', ti );
      fprintf ( 1, '  30=%d, 60=%d, 90=%d\n', a, b, c );
      continue;
    end

    x = [ w2_xy(a,1), w2_xy(b,1), w2_xy(c,1) ];
    y = [ w2_xy(a,2), w2_xy(b,2), w2_xy(c,2) ];
    col = type_to_color ( tt(ti) );
    rgb = color_rgb ( col );
    fill ( x, y, rgb );

    if ( element_number )
      xc = ( w2_xy(a,1) + w2_xy(b,1) + w2_xy(c,1) ) / 3.0;
      yc = ( w2_xy(a,2) + w2_xy(b,2) + w2_xy(c,2) ) / 3.0;
      lc = sprintf ( '%d', ti );
      text ( xc, yc, lc, 'HorizontalAlignment', 'Center' );
    end 

  end
%
%  Draw nodes.
%
  if ( node_show )
    plot ( w2_xy(:,1), w2_xy(:,2), 'wo', ...
      'markersize', 15, ...
      'markeredgecolor', 'k', ...
      'markerfacecolor', 'w' );
%
%  Label nodes.
%
    for wi = 1 : wn
      node_label = sprintf ( '%d', wi );
      text ( w2_xy(wi,1), w2_xy(wi,2), node_label, 'HorizontalAlignment', 'Center' );
    end

  end
%
%  Finish the plot.
%
  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  xmin = min ( w_xy(:,1) );
  xmax = max ( w_xy(:,1) );
  dx = xmax - xmin;
  ymin = min ( w_xy(:,2) );
  ymax = max ( w_xy(:,2) );
  dy = ymax - ymin;
  xmin = xmin - 0.10 * dx;
  xmax = xmax + 0.10 * dx;
  ymin = ymin - 0.10 * dy;
  ymax = ymax + 0.10 * dy;
  axis ( [ xmin, xmax, ymin, ymax ] )
  title ( title_string );
 
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

