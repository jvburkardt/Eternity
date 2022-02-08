function node_xy_plot ( v_xy, u_xy, s_xy, label, filename )

%*****************************************************************************80
%
%% node_xy_plot() plots the nodes of an object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    real V_XY(VN,2), the coordinates of the vertices.
%
%    real U_XY(UN,2), the coordinates of the nodes.
%
%    integer S_XY(SN,2), the (x,y) coordinates of the subnodes.
%
%    character LABEL, a title for the plot.
%
%    character FILENAME, a filename for the plot.
%
  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Draw vertices connected pairwise.
%
  if ( false )
    vn = size ( v_xy, 1 );
    for vi = 1 : vn
      vip1 = i4_wrap ( vi + 1, 1, vn );
        plot ( [ v_xy(vi,1), v_xy(vip1,1)], [ v_xy(vi,2), v_xy(vip1,2) ], ...
          'b-', 'linewidth', 3 );
    end
  end
%
%  Draw the boundary.
%
  polygon_draw ( v_xy );
%
%  Draw subnodes.
%
  sn = size ( s_xy, 1 );
  plot ( s_xy(:,1), s_xy(:,2), 'k.', 'markersize', 10 );
%
%  Draw nodes.
%
  un = size ( u_xy, 1 );
  plot ( u_xy(:,1), u_xy(:,2), 'wo', ...
    'markersize', 20, ...
    'markeredgecolor', 'k', ...
    'markerfacecolor', 'w' );
%
%  Label nodes.
%
  for i = 1 : un
    label_node = sprintf ( '%d', i );
    text ( u_xy(i,1), u_xy(i,2), label_node, 'HorizontalAlignment', 'Center' );
  end

  hold ( 'off' );
  grid ( 'on' );
  axis ( 'equal' );
  title ( label );
 
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

