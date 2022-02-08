function node_ij_plot ( v_ij, u_ij, s_ij, label, filename )

%*****************************************************************************80
%
%% node_ij_plot() plots the (i,j) coordinates of nodes of a object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer V_IJ(VN,2), the (i,j) coordinates of the vertices.
%
%    integer U_IJ(UN,2), the (i,j) coordinates of the nodes.
%
%    integer S_IJ(SN,2), the (i,j) coordinates of the subnodes.
%
%    character LABEL, a title for the plot.
%
%    character FILENAME, a filename for the plot.
%
  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Draw the boundary.
%
  polygon_draw ( v_ij );
%
%  Draw subnodes.
%
  sn = size ( s_ij, 1 );
  plot ( s_ij(:,1), s_ij(:,2), 'k.', 'markersize', 10 );
%
%  Draw nodes.
%
  un = size ( u_ij, 1 );
  plot ( u_ij(:,1), u_ij(:,2), 'wo', ...
    'markersize', 20, ...
    'markeredgecolor', 'k', ...
    'markerfacecolor', 'w' );
%
%  Label nodes.
%
  for i = 1 : un
    label_node = sprintf ( '%d', i );
    text ( u_ij(i,1), u_ij(i,2), label_node, 'HorizontalAlignment', 'Center' );
  end

  hold ( 'off' );
  grid ( 'on' );
  imin = min ( v_ij(:,1) );
  imax = max ( v_ij(:,1) );
  jmin = min ( v_ij(:,2) );
  jmax = max ( v_ij(:,2) );
  axis ( [ imin-1, imax+1, jmin-1, jmax+1 ] );
  title ( label );
 
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );

  return
end

