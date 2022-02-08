function u_xy = node_ij_to_xy ( u_ij, p_ij )

%*****************************************************************************80
%
%% node_ij_to_xy() converts node coordinates from (i,j) to (x,y).
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
%    real U_IJ(UN,2): the (i,j) coordinates of the nodes.
%
%    real P_IJ(1,2): the (i,j) coordinates of the base point.
%
%  Output:
%
%    real U_XY(UN,2): the (x,y) coordinates of the nodes.
%
  u_xy = zeros ( size ( u_ij ) );
  u_xy(:,1) = u_ij(:,1) * 0.25;
  u_xy(:,2) = u_ij(:,2) * sqrt ( 3.0 ) / 12.0;

  return
end

