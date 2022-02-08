function u_ij = node_ij ( w, p_ij )

%*****************************************************************************80
%
%% node_ij() returns the (i,j) coordinates of grid nodes.
%
%  Discussion:
%
%    The nodes are determined automatically.
%
%    First, the extent of the region is determined.
%
%    Second, the range of the region is determined.
%
%    Then a rectangular object is constructed that has at least the same range.
%
%    The nodes of the rectangular object can be generated automatically,
%    starting in the lower left corner, going up first, and then across.
%
%    Each such node can be queried as to whether it is inside the polygon
%    determined by the object.  If so, it is added to the node list.
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
%    character vector W: the boundary word.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%
%  Output:
%
%    real U_IJ(UN,2): the (i,j) coordinates of the nodes.
%

%
%  Get the range of the object.
%
  [ imin, imax, jmin, jmax ] = word_range_ij ( w, p_ij );
%
%  Get the vertices of the object.
%
  v_ij = word_to_vertex_ij ( w, p_ij );
%
%  Save first node locations so we can undo shifting.
%
  i2 = v_ij(1,1);
  j2 = v_ij(1,2);
%
%  #1: Ensure positive values.
%
  i_shift1 = - min ( v_ij(:,1) );
  j_shift1 = - min ( v_ij(:,2) );
  v_ij(:,1) = v_ij(:,1) + i_shift1;
  v_ij(:,2) = v_ij(:,2) + j_shift1;

  if ( false )
    fprintf ( 1, 'Vij after positive shift:\n' );
    v_ij
  end
%
%  #2: Ensure base point is at a multiple of (4,6).
%
  i_shift2 = mod ( v_ij(1,1), 4 );
  if ( i_shift2 ~= 0 )
    i_shift2 = 4 - i_shift2;
  end
  j_shift2 = mod ( v_ij(1,2), 12 );
  if ( j_shift2 ~= 0 )
    j_shift2 = 12 - j_shift2;
  end
  v_ij(:,1) = v_ij(:,1) + i_shift2;
  v_ij(:,2) = v_ij(:,2) + j_shift2;

  if ( false )
    fprintf ( 1, 'Vij after modular shift:\n' );
    v_ij
  end
%
%  Generate a rectangle that covers the object, and
%  aligns with the triangles.
%
  ni = max ( v_ij(:,1) ) + 1;
  nj = max ( v_ij(:,2) ) + 1;
%
%  Adjust NX and NY to match I and J.
%
  nx = floor ( ( ni - 1 ) / 4 );
  if ( 4 * nx + 1 < ni )
    nx = nx + 1;
  end
  ny = floor ( ( nj - 1 ) / 6 );
  if ( 6 * ny + 1 < nj )
    ny = ny + 1;
  end

  ur_ij = rectangle_node_ij ( nx, ny );
%
%  Determine which rectangle nodes are contained in the object.
%
  urn = size ( ur_ij, 1 );

  un = 0;
  u_ij = zeros ( un, 2 );
  for uri = 1 : urn
    inside = polygon_contains_point ( v_ij, ur_ij(uri,1:2) );
    if ( inside )
      un = un + 1;
      u_ij = [ u_ij; ur_ij(uri,1:2) ];
    end
  end
%
%  Undo the shift.
%
  i2 = v_ij(1,1) - i2;
  j2 = v_ij(1,2) - j2;

  u_ij(:,1) = u_ij(:,1) - i2;
  u_ij(:,2) = u_ij(:,2) - j2;

  return
end

