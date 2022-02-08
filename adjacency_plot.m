function adjacency_plot ( adj, t1_ij, p_xy, label, filename )

%*****************************************************************************80
%
%% adjacency_plot() displays the 30-60-90 triangles of an object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 November 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer adj(tn,3): the indices of the adjacent triangles oppposite
%    the 30, 60, and 90 angles.
%
%    integer t1_ij(3,2), the (i,j) vertex coordinates of 30-60-90 triangle #1.
%
%    real p_xy(1,2): the (x,y) coordinates of the 30 degree vertex of triangle #1.
%
%    character label: a title to be printed above the plot.
%
%    character filename: a filename for the plot.
%
%  Local:
%
%    integer t1_xy(3,2), the (x,y) vertex coordinates of 30-60-90 triangle #1.
%

%
%  Count the triangles.
%
  tn = size ( adj, 1 );
%
%  Convert t1_ij to t1_xy:
%
  t1_xy = node_ij_to_xy ( t1_ij, p_xy );
%
%  Get xy coordinates of vertices.
%
  [ a_xy, b_xy, c_xy ] = adjacency_to_triangle_xy ( adj, t1_xy );
%
%  Plot the triangles.
%
  figure ( 1 );
  clf ( );
  hold ( 'on' );
  for ti = 1 : tn
    if ( is_octave )
      patch ( [ a_xy(ti,1), b_xy(ti,1), c_xy(ti,1) ], ...
              [ a_xy(ti,2), b_xy(ti,2), c_xy(ti,2) ],  'r' );
    else
      tri = polyshape ( [ a_xy(ti,1), b_xy(ti,1), c_xy(ti,1) ], ...
                        [ a_xy(ti,2), b_xy(ti,2), c_xy(ti,2) ] );
      plot ( tri, 'facecolor', 'r' );
    end
    plot ( [ a_xy(ti,1), b_xy(ti,1), c_xy(ti,1) ], ...
           [ a_xy(ti,2), b_xy(ti,2), c_xy(ti,2) ], ...
      'b.', 'markersize', 35 );
    t_text = sprintf ( '%d', ti );
    x = ( a_xy(ti,1) + b_xy(ti,1) + c_xy(ti,1) ) / 3.0;
    y = ( a_xy(ti,2) + b_xy(ti,2) + c_xy(ti,2) ) / 3.0;
    text ( x, y, t_text, 'HorizontalAlignment', 'center', ...
      'fontsize', 7, 'fontweight', 'bold' );
  end
  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  title ( label );
%
%  Save the plot.
%
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

