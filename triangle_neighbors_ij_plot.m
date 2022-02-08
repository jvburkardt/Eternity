function triangle_neighbors_ij_plot ( )

%*****************************************************************************80
%
%% triangle_neighbors_ij_plot() displays the neighbors of a 30-60-90 triangle.
%
%  Discussion:
%
%    Starting at one triangle, we alternate looking for neighbors across the
%    60 and 90 degree angles, resulting in a sort of clock face of 12 triangles.
%
%    The (i,j) coordinate system is used.
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
  fprintf ( 1, 'triangle_neighbors_ij_plot():\n' );
  fprintf ( 1, '  Compute the three neighbors of a 30-60-90 triangle\n' );
  fprintf ( 1, '  and plot them.\n' );
%
%  Our base triangle is between the 4 and 3 oclock position.
%  The first triangle we draw is between 3 and 2 oclock, and
%  we continue counter clockwise.
%
  a_ij = [ 0,  0 ];
  b_ij = [ 2, -2 ];
  c_ij = [ 2,  0 ];

  figure ( );
  clf ( );
  hold ( 'on' );

  plot ( a_ij(1), a_ij(2), 'r.', 'markersize', 35 );

  count = 0;
  for i = 1 : 6
    for k = 2 : 3
      [ a_ij, b_ij, c_ij ] = triangle_neighbor_ij ( a_ij, b_ij, c_ij, k );
      if ( is_octave ( ) )
        patch ( [ a_ij(1), b_ij(1), c_ij(1) ], ...
                [ a_ij(2), b_ij(2), c_ij(2) ], rand ( 1, 3 ) );
      else
        abc = polyshape ( [ a_ij(1), b_ij(1), c_ij(1) ], ...
                          [ a_ij(2), b_ij(2), c_ij(2) ] );
        plot ( abc, 'facecolor', rand ( 1, 3 ) );
      end
      count = count + 1;
      label = sprintf ( '%d', count );
      ci = ( a_ij(1) + b_ij(1) + c_ij(1) ) / 3.0;
      cj = ( a_ij(2) + b_ij(2) + c_ij(2) ) / 3.0;
      text ( ci, cj, label, 'HorizontalAlignment', 'Center' );
      plot ( b_ij(1), b_ij(2), 'g.', 'markersize', 35 );
      plot ( c_ij(1), c_ij(2), 'b.', 'markersize', 35 );
    end
  end
  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  title ( { 'triangle neighbors ij:', 'Follow neighbor triangles around a point' } );
%
%  Save the plot.
%
  filename = 'triangle_neighbors_ij.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

