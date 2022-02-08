function edge_plot ( e, label, filename )

%*****************************************************************************80
%
%% edge_plot() plots the (i,j) or (x,y) coordinates of edge nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    real E(EN,2): the (i,j) or (x,y) coordinates of the edge nodes.
%
%    character LABEL, a title for the plot.
%
%    character FILENAME, the name of the file into which the plot is stored.
%
  figure ( );
  clf ( );
%
%  Plot the connections between nodes.
%
  hold ( 'on' );

  en = size ( e, 1 );
  for ei = 1 : en
    plot ( e([1:en,1],1), e([1:en,1],2), 'r', 'linewidth', 2 );
  end
%
%  Plot the nodes.
%
  plot ( e(:,1), e(:,2), 'k.', 'markersize', 15 );

  hold ( 'off' );

  grid ( 'on' );
  axis ( 'equal' );
  title ( label );
 
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

