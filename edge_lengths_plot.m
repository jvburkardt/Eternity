function edge_lengths_plot ( )

%*****************************************************************************80
%
%% edge_lengths_plot() plots edge lengths in a hexagon.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2021
%
%  Author:
%
%    John Burkardt
%
  [ w, p_ij ] = hexagon_word ( );
  p_ij = [ -2, -6 ];
  title_string = 'edge lengths';
  filename = 'edge_lengths.png';

  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Retrieve the node coordinates.
%
  w_ij = node_ij ( w, p_ij );
  w_xy = node_ij_to_xy ( w_ij, p_ij );
  wn = size ( w_xy, 1 );
%
%  Retrieve the indices of the nodes making up each triangle.
%
  [ tk, tt, w2_ij ] = triangle_k ( w, p_ij );
  w2_xy = node_ij_to_xy ( w2_ij, p_ij );
  tn = size ( tk, 1 );
%
%  Draw the triangles.
%
  for ti = 1 : tn

    a = tk(ti,1);
    b = tk(ti,2);
    c = tk(ti,3);

    x = [ w2_xy(a,1), w2_xy(b,1), w2_xy(c,1) ];
    y = [ w2_xy(a,2), w2_xy(b,2), w2_xy(c,2) ];
    col = type_to_color ( tt(ti) );
    rgb = color_rgb ( col );
    fill ( x, y, rgb );
  end
%
%  Label the edges.
%
  for ti = 1 : tn

    a = tk(ti,1);
    b = tk(ti,2);
    c = tk(ti,3);

    xc = ( w2_xy(a,1) + w2_xy(b,1) ) / 2.0;
    yc = ( w2_xy(a,2) + w2_xy(b,2) ) / 2.0;
    plot ( xc, yc, 'wo', ...
      'markersize', 25, ...
      'markeredgecolor', 'k', ...
      'markerfacecolor', 'w' );
    lc = 'C';
    text ( xc, yc, lc, 'HorizontalAlignment', 'Center' );

    xc = ( w2_xy(b,1) + w2_xy(c,1) ) / 2.0;
    yc = ( w2_xy(b,2) + w2_xy(c,2) ) / 2.0;
    plot ( xc, yc, 'wo', ...
      'markersize', 25, ...
      'markeredgecolor', 'k', ...
      'markerfacecolor', 'w' );
    lc = 'A';
    text ( xc, yc, lc, 'HorizontalAlignment', 'Center' );

    xc = ( w2_xy(c,1) + w2_xy(a,1) ) / 2.0;
    yc = ( w2_xy(c,2) + w2_xy(a,2) ) / 2.0;
    plot ( xc, yc, 'wo', ...
      'markersize', 25, ...
      'markeredgecolor', 'k', ...
      'markerfacecolor', 'w' );
    lc = 'B';
    text ( xc, yc, lc, 'HorizontalAlignment', 'Center' );

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
  xmin = xmin - 0.05 * dx;
  xmax = xmax + 0.05 * dx;
  ymin = ymin - 0.05 * dy;
  ymax = ymax + 0.05 * dy;
  axis ( [ xmin, xmax, ymin, ymax ] )
  title ( title_string );
 
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

