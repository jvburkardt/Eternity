function border_plot ( e, plot_label, filename )

%*****************************************************************************80
%
%% border_plot() plots the boundary of an object.
%
%  Discussion:
%
%    The border is displayed by joining the edge nodes e.
%
%    The edge coordinates can be in (i,j) or (x,y) coordinates.
%    
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer/real e(VN,2), the (i,j) or (x,y) edge node coordinates.
%
%    character PLOT_LABEL, a title for the plot.
%
%    character FILENAME, a filename for the plot.
%
  en = size ( e, 1 );

  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Connect edge nodes in sequence to draw the border.
%
  r = e(en,1:2);
  for ei = 1 : en
    q = r;
    r = e(ei,1:2);
    plot ( [ q(1), r(1)], [ q(2), r(2) ], 'm-', 'linewidth', 3 );
  end
%
%  Mark the edge nodes.
%
  plot ( e(1:en,1), e(1:en,2), 'k.', 'markersize', 25 );

  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  title ( plot_label );
 
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

