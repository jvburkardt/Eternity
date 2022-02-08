function rectangle_triangle_plot ( nx, ny )

%*****************************************************************************80
%
%% rectangle_triangle_plot() plots triangles in a rectangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2021
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
  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Retrieve node coordinates.
%
  w_ij = rectangle_node_ij ( nx, ny );
  p_xy = [ 0.0, 0.0 ];
  w_xy = node_ij_to_xy ( w_ij, p_xy );
  wn = size ( w_xy, 1 );
%
%  Retrieve the indices of the nodes making up each triangle.
%
  [ tk, tt ] = rectangle_triangle_k ( nx, ny );
  tn = size ( tk, 1 );
%
%  Draw some triangles within the hexagon.
%  Color each triangle by its type (1 - 12 );
%
  for ti = 1 : tn

    a = tk(ti,1);
    b = tk(ti,2);
    c = tk(ti,3);

    x = [ w_xy(a,1), w_xy(b,1), w_xy(c,1) ];
    y = [ w_xy(a,2), w_xy(b,2), w_xy(c,2) ];
    col = type_to_color ( tt(ti) );
    rgb = color_rgb ( col );
    fill ( x, y, rgb );
    xc = ( w_xy(a,1) + w_xy(b,1) + w_xy(c,1) ) / 3.0;
    yc = ( w_xy(a,2) + w_xy(b,2) + w_xy(c,2) ) / 3.0;
    lc = sprintf ( '%d', ti );
    text ( xc, yc, lc, 'HorizontalAlignment', 'Center' );

  end
%
%  Draw nodes.
%
  plot ( w_xy(:,1), w_xy(:,2), 'wo', ...
    'markersize', 25, ...
    'markeredgecolor', 'k', ...
    'markerfacecolor', 'w' );
%
%  Label nodes.
%
  for wi = 1 : wn
    node_label = sprintf ( '%d', wi );
    text ( w_xy(wi,1), w_xy(wi,2), node_label, 'HorizontalAlignment', 'Center' );
  end
%
%  Finish the plot.
%
  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  title_string = sprintf ( 'rectangle_%dx%d triangles', nx, ny );
  title ( title_string );
 
  filename = sprintf ( 'rectangle_%dx%d_triangle.png', nx, ny );
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

