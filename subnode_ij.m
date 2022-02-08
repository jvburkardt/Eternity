function s_ij = subnode_ij ( w, p_ij )

%*****************************************************************************80
%
%% subnode_ij() returns the (i,j) coordinates of subnodes of an Eternity object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2021
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
%    real S_IJ(S2,2): the (i,j) coordinates of the subnodes.
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
%  #1: Ensure positive values.
%
  i_shift1 = - min ( v_ij(:,1) );
  j_shift1 = - min ( v_ij(:,2) );
  v_ij(:,1) = v_ij(:,1) + i_shift1;
  v_ij(:,2) = v_ij(:,2) + j_shift1;

  if ( false )
    fprintf ( 1, '  i_shift1 = %d, j_shift1 = %d\n', i_shift1, j_shift1 );
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
%
%  Get the nodes of the rectangle that is at least as big as the object.
%
  sr_ij = rectangle_subnode_ij ( nx, ny );
%
%  Shift rectangle nodes to match origin of the object.
%
  sr_ij(:,1) = sr_ij(:,1) + imin;
  sr_ij(:,2) = sr_ij(:,2) + jmin;
%
%  Determine which rectangle nodes are contained in the object.
%
  srn = size ( sr_ij, 1 );

  sn = 0;
  s_ij = zeros ( sn, 2 );
  for sri = 1 : srn
    inside = polygon_contains_point ( v_ij, sr_ij(sri,1:2) );
    if ( inside )
      sn = sn + 1;
      s_ij = [ s_ij; sr_ij(sri,1:2) ];
    end
  end

  for si = 1 : sn
    s_ij(si,1) = s_ij(si,1) + imin - i_shift2;
    s_ij(si,2) = s_ij(si,2) + jmin - j_shift2;
  end

  return
end

