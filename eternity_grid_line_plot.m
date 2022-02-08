function eternity_grid_line_plot ( )

%*****************************************************************************80
%
%% eternity_grid_line_plot() plots the grid lines of the Eternity grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2021
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'eternity_grid_line_plot():\n' );
  fprintf ( 1, '  Plot the grid lines of the Eternity grid.\n' );
%
%  Get the (x,y) coordinates of the edge nodes.
%
  [ w, p_xy ] = eternity_grid_word ( );
  e = word_to_edge_xy ( w, p_xy );
  en = size ( e, 1 );
%
%  Get the indices of the edge nodes that define grid lines.
%
  opp = eternity_grid_line_edges ( );
%
%  Begin the plot.
%
  figure ( 1 );
  clf ( );
  hold ( 'on' );
%
%  Draw grid lines in each of 6 directions.
%
  for k = 1 : 6
    for ei = 1 : en
      ej = opp(ei,k);
      if ( 0 < ej ) 
        ex = [ e(ei,1), e(ej,1) ];
        ey = [ e(ei,2), e(ej,2) ];
        plot ( ex, ey, 'b-', 'linewidth', 1 );
      end
    end
  end
%
%  Finish the plot.
%
  hold ( 'off' );
  axis ( 'equal' );
  axis ( 'off' );
  title ( 'Eternity grid lines' );
 
  filename = 'eternity_grid_line.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'eternity_grid_line_plot():\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

