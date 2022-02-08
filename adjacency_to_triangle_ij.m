function [ a_ij, b_ij, c_ij ] = adjacency_to_triangle_ij ( adj, t1_ij )

%*****************************************************************************80
%
%% adjacency_to_triangle_ij() computes (i,j) triangle vertices from adjacency.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2021
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
%  Output:
%
%    integer a_ij(tn,2), b_ij(tn,2), c_ij(tn,2): the (i,j) coordinates of the 
%    vertices of the 30-60-90 triangles.
%

%
%  Get the number of triangles in the shape.
%
  tn = size ( adj, 1 );
%
%  Set aside space for the vertices.
%
  a_ij = zeros ( tn, 2 );
  b_ij = zeros ( tn, 2 );
  c_ij = zeros ( tn, 2 );
%
%  Set aside space for list of drawn triangles.
%
  drawn = false ( tn, 1 );
%
%  Define the first triangle, and "draw" it.
%
  tk = 1;
  a_ij(tk,1:2) = t1_ij(1,1:2);
  b_ij(tk,1:2) = t1_ij(2,1:2);
  c_ij(tk,1:2) = t1_ij(3,1:2);
  drawn(tk) = true;

  left = tn - 1;

  while ( 0 < left )
    found = 0;
    for ti = 1 : tn
      if ( drawn(ti) )
        for k = 1 : 3
          tk = adj(ti,k);
          if ( 0 < tk )
            if ( ~ drawn(tk) )
              [ ak_ij, bk_ij, ck_ij ] = triangle_neighbor_ij ( ...
                a_ij(ti,1:2), b_ij(ti,1:2), c_ij(ti,1:2), k );
              a_ij(tk,1:2) = ak_ij;
              b_ij(tk,1:2) = bk_ij;
              c_ij(tk,1:2) = ck_ij;
              drawn(tk) = true;
              found = found + 1;
              left = left - 1;
            end
          end
        end
      end
    end
%
%  If the shape is not connected, or the adjacency information 
%  is defective, we may end up with some unconnected triangles,
%  and a potential infinite loop.  End it.
%
    if ( found == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'adjacency_to_triangle_ij - Fatal error!\n' );
      fprintf ( 1, '  Number of unconnected triangles = %d\n', left );
      fprintf ( 1, '  but no connections were found.\n' );
      error ( 'adjacency_to_triangle_ij - Fatal error!' );
    end

  end

  return
end

