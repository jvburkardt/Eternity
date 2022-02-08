function [ t2k, t2t, w2_ij ] = triangle_k ( w, p_ij )

%*****************************************************************************80
%
%% triangle_k() indexes the nodes forming triangles in an object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character W(WN), the boundary word.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%
%  Output:
%
%    integer T2K(T2KN,3), the indices of the nodes forming each triangle.
%
%    integer T2T(T2KN,1), the type of the triangle.
%    1 through 6 describes the rotation, and the sign describes the parity.
%
%    integer W2_IJ(W2N,2), the (i,j) coordinates of the nodes.
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
%  Shift V if necessary.
%  HYPOTHESIS:
%    Base point must be at (vi1,vj1) with vi1 a multiple of 4, and
%    vj1 a multiple of 12 (not 6!  The vertical pattern takes longer.)
%
  if ( false )
    fprintf ( 1, 'Pij, Vij before shift:\n' );
    p_ij
    v_ij
  end
%
%  #1: Ensure positive values.
%
  i_shift1 = - min ( v_ij(:,1) );
  j_shift1 = - min ( v_ij(:,2) );

  p_ij(1,1) = p_ij(1,1) + i_shift1;
  p_ij(1,2) = p_ij(1,2) + j_shift1;

  v_ij(:,1) = v_ij(:,1) + i_shift1;
  v_ij(:,2) = v_ij(:,2) + j_shift1;

  if ( false )
    fprintf ( 1, '  i_shift1 = %d, j_shift1 = %d\n', i_shift1, j_shift1 );
    fprintf ( 1, 'Pij, Vij after positive shift:\n' );
    p_ij
    v_ij
  end
%
%  #2: Ensure base point is at a multiple of (4,12).
%
  i_shift2 = mod ( p_ij(1,1), 4 );
  if ( i_shift2 ~= 0 )
    i_shift2 = 4 - i_shift2;
  end
  j_shift2 = mod ( p_ij(1,2), 12 );
  if ( j_shift2 ~= 0 )
    j_shift2 = 12 - j_shift2;
  end

  if ( false )
    fprintf ( 1, '  Ensure base point is a multiple of (4,12)\n' );
    fprintf ( 1, '  i_shift2 = %d, j_shift2 = %d\n', i_shift2, j_shift2 );
  end

  v_ij(:,1) = v_ij(:,1) + i_shift2;
  v_ij(:,2) = v_ij(:,2) + j_shift2;

  if ( false )
    fprintf ( 1, 'Pij, Vij after modular shift:\n' );
    p_ij
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
%
%  Get the nodes in the rectangle.
%
  u_ij = rectangle_node_ij ( nx, ny );
  un = size ( u_ij, 1 );

  if ( false )
    fprintf ( 1, '  triangle_k uses a %d x %d rectangle with %d nodes\n', nx, ny, un );
  end
%
%  Report rectangle range.
%
  rimin = min ( u_ij(:,1) );
  rimax = max ( u_ij(:,1) );
  rjmin = min ( u_ij(:,2) );
  rjmax = max ( u_ij(:,2) );
 
  if ( false )
    fprintf ( 1, '  Rectangle range %d <= i <= %d, %d <= j <= %d\n', ...
      rimin, rimax, rjmin, rjmax );
  end
%
%  Get the node index map.
%
  node_map = - ones ( un, 1 );
  u2n = 0;
  for ui = 1 : un
    inside = polygon_contains_point ( v_ij, u_ij(ui,1:2) );
    if ( inside )
      u2n = u2n + 1;
      node_map(ui) = u2n;
    end
  end

  if ( false )
    fprintf ( 1,'nodemap:\n' );
    [ (1:un)', node_map ]
    fprintf ( 1, '  Number of rectangle nodes in object = %d\n', u2n );
  end
%
%  Get the properties of the triangles in the rectangle.
%
  [ tk, tt ] = rectangle_triangle_k ( nx, ny );
  tkn = size ( tk, 1 );
  ttn = size ( tt, 1 );
%
%  Collect those rectangle triangles that are contained in the object.
%
  t2kn = 0;
  t2k = zeros ( t2kn, 3 );
  t2t = zeros ( t2kn, 1 );

  for ti = 1 : tkn

    cx = 0.0;
    cy = 0.0;
    for j = 1 : 3
      k = tk(ti,j);
      cx = cx + u_ij(k,1);
      cy = cy + u_ij(k,2);
    end
    cx = cx / 3.0;
    cy = cy / 3.0;
    q = [ cx, cy ];

    inside = polygon_contains_point ( v_ij, q );

    if ( false )
      if (inside )
        fprintf ( 1, 'rectangle %d', ti );
        for j = 1 : 3
          k = tk(ti,j);
          fprintf ( '(%d,%d)', u_ij(k,1), u_ij(k,2) );
        end
        fprintf ( 1, '\n' );
      end
    end
%
%  T2K needs to index the nodes using an object index, not the rectangle index.
%  The array node_map() handles this renumbering.
%
    if ( inside )
      t2kn = t2kn + 1;
      for j = 1 : 3
        uj = tk(ti,j);
        u2j = node_map(uj);
        t2k(t2kn,j) = u2j;
      end
      t2t(t2kn,1) = tt(ti,1);
      if ( false )
        fprintf ( 1, 'triangle %d, type %d, (%d,%d,%d), (%d,%d,%d)\n', ...
          t2kn, t2t(t2kn,1), tk(ti,1:3), t2k(t2kn,1:3) )
      end
    end

  end

  if ( false )
    fprintf ( 1, '  Number of rectangle triangles in object = %d\n', t2kn );
  end
%
%  Create new node coordinate list.
%
  w2_ij = zeros ( u2n, 2 );
  u2n = 0;
  p_ij(1,1) = p_ij(1,1) + imin - i_shift2;
  p_ij(1,2) = p_ij(1,2) + jmin - j_shift2;
  for ui = 1 : un
    if ( 0 < node_map(ui) )
      u2n = u2n + 1;
%     w2_ij(u2n,1) = u_ij(ui,1) + imin;
%     w2_ij(u2n,2) = u_ij(ui,2) + jmin;
      w2_ij(u2n,1) = u_ij(ui,1) + imin - i_shift2;
      w2_ij(u2n,2) = u_ij(ui,2) + jmin - j_shift2;
    end
  end

  return
end

