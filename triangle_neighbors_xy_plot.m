function triangle_neighbors_xy_plot ( )

%*****************************************************************************80
%
%% triangle_neighbors_xy_plot() displays the neighbors of a 30-60-90 triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2021
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'triangle_neighbors_xy_plot():\n' );
  fprintf ( 1, '  Compute the three neighbors of a 30-60-90 triangle\n' );
  fprintf ( 1, '  and plot them.\n' );
%
%  Triangle vertices.
%
  a_xy = [   0.0, 1.0 ];
  b_xy = [ - 0.5, 0.0 ];
  c_xy = [   0.0, 0.0 ];

  [ A_xy, B_xy, C_xy ] = triangle_neighbors_xy ( a_xy, b_xy, c_xy );
%
%  Plot them.
%
  figure ( );
  clf ( );
  hold ( 'on' );

  if ( is_octave ( ) )
    patch ( [ a_xy(1), b_xy(1), c_xy(1) ], ...
            [ a_xy(2), b_xy(2), c_xy(2) ], 'r' );
    patch ( [ A_xy(1), b_xy(1), c_xy(1) ], ...
            [ A_xy(2), b_xy(2), c_xy(2) ], 'b' );
    patch ( [ a_xy(1), B_xy(1), c_xy(1) ], ...
            [ a_xy(2), B_xy(2), c_xy(2) ], 'g' );
    patch ( [ a_xy(1), b_xy(1), C_xy(1) ], ...
            [ a_xy(2), b_xy(2), C_xy(2) ], 'm' );
  else
    abc = polyshape ( [ a_xy(1), b_xy(1), c_xy(1) ], ...
                      [ a_xy(2), b_xy(2), c_xy(2) ] );
    Abc = polyshape ( [ A_xy(1), b_xy(1), c_xy(1) ], ...
                      [ A_xy(2), b_xy(2), c_xy(2) ] );
    aBc = polyshape ( [ a_xy(1), B_xy(1), c_xy(1) ], ...
                      [ a_xy(2), B_xy(2), c_xy(2) ] );
    abC = polyshape ( [ a_xy(1), b_xy(1), C_xy(1) ], ...
                      [ a_xy(2), b_xy(2), C_xy(2) ] );
    plot ( abc, 'facecolor', 'r' );
    plot ( Abc, 'facecolor', 'b' );
    plot ( aBc, 'facecolor', 'g' );
    plot ( abC, 'facecolor', 'm' );
  end
  plot ( [ a_xy(1), A_xy(1) ], [ a_xy(2), A_xy(2) ], 'b.', 'markersize', 35 );
  plot ( [ b_xy(1), B_xy(1) ], [ b_xy(2), B_xy(2) ], 'g.', 'markersize', 35 );
  plot ( [ c_xy(1), C_xy(1) ], [ c_xy(2), C_xy(2) ], 'm.', 'markersize', 35 );

  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  title ( { 'triangle_neighbors_xy:', 'The three neighbors of a 30-60-90 triangle' } );
%
%  Save the plot.
%
  filename = 'triangle_neighbors_xy.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

