function vertex_plot ( v, plot_label, filename )

%*****************************************************************************80
%
%% vertex_plot() plots the boundary vertices of an object.
%
%  Discussion:
%
%    The vertices V can be in (i,j) or (x,y) coordinates.
%    
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer/real v(VN,2), the (i,j) or (x,y) vertex coordinates.
%
%    character PLOT_LABEL, a title for the plot.
%
%    character FILENAME, a filename for the plot.
%
  vn = size ( v, 1 );

  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Connect pairs of vertices to draw the border.
%
  r = v(vn,1:2);
  for vi = 1 : vn
    q = r;
    r = v(vi,1:2);
    plot ( [ q(1), r(1)], [ q(2), r(2) ], 'm-', 'linewidth', 3 );
  end
%
%  Draw vertices.
%  Stupid Octave can't draw a node and then a label on top of it.
%
  if ( is_octave ( ) )

  else
    plot ( v(:,1), v(:,2), 'wo', ...
      'markersize', 25, ...
      'markeredgecolor', 'k', ...
      'markerfacecolor', 'w' );
  end
%
%  Label the vertices with an index.
%
  for vi = 1 : vn
    node_label = sprintf ( '%d', vi );
    text ( v(vi,1), v(vi,2), node_label, ...
      'color', 'red', ...
      'HorizontalAlignment', 'Center' );
  end

  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  title ( { plot_label, '' } );
 
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

