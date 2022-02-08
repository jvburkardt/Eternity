function hexagon3_grid_line_plot ( )

%*****************************************************************************80
%
%% hexagon3_grid_line_plot() plots the lines of a hexagon3 grid.
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
  fprintf ( 1, 'hexagon3_grid_line_plot\n' );
  fprintf ( 1, '  Plot the lines of a hexagon3 grid.\n' );

  [ w, p_xy ] = hexagon3_word ( );
%
%  Get the (x,y) coordinates of the edge nodes.
%
  e = word_to_edge_xy ( w, p_xy );
  en = size ( e, 1 );
%
%  Get the indices of the edge nodes that define grid lines.
%
  opp = hexagon3_grid_line_edges ( );
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
        if ( k <= 3 )
          plot ( ex, ey, 'b-', 'linewidth', 1 );
        else
          plot ( ex, ey, 'b-', 'linewidth', 1 );
        end
      end
    end
  end
%
%  Finish the plot.
%
  hold ( 'off' );
  axis ( 'equal' );
  axis ( 'off' );
  title ( 'hexagon3 grid lines' );
 
  filename = 'hexagon3_grid_line.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'hexagon3_grid_line_plot\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

