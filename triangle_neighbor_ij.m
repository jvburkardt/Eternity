function [ ak_ij, bk_ij, ck_ij ] = triangle_neighbor_ij ( a_ij, b_ij, c_ij, k )

%*****************************************************************************80
%
%% triangle_neighbor_ij() computes (i,j) coordinates of a triangle neighbor.
%
%  Discussio:
%
%    This function computes the (i,j) coordinates of the vertices of one of
%    the three neighbor triangles of a 30-60-90 triangle.
%
%    For a triangle with vertices abc, the neighboring triangles have vertices:
%
%      Abc
%      aBc
%      abC
%
%    Assuming abc are in counterclockwise order, then Abc, aBc, and abC are
%    in clockwise order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    real a_ij(2), b_ij(2), c_ij(2): the (i,j) coordinates of the vertices of
%    a 30-60-90 triangle.  Vertices a, b, and c are associated with the
%    30, 60, and 90 degree angles, respectively.
%
%    integer k: indicates the neighbor triangle:
%    1, 2, 3 means opposite the 30, 60, or 90 degree vertex respectively.
%
%  Output:
%
%    real ak_ij(2), bk_ij(2), ck_ij(2): the (i,j) coordinates of the vertices 
%    defining the neighboring 30-60-90 triangles opposite vertices a,
%    b, and c, respectively.
%
  if ( k == 1 )
    ak_ij = 2 * c_ij - a_ij;
    bk_ij = b_ij;
    ck_ij = c_ij;
  elseif ( k == 2 )
    ak_ij = a_ij;
    bk_ij = 2 * c_ij - b_ij;
    ck_ij = c_ij;
  elseif ( k == 3 )
    ak_ij = a_ij;
    bk_ij = b_ij;
    dk_ij = ( a_ij + 3 * b_ij ) / 4;
    ck_ij = 2 * dk_ij - c_ij;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'triangle_neighbor_ij - Fatal error!\n' );
    fprintf ( 1, '  Illegal neighbor index k = %d\n', k );
    error ( 'triangle_neighbor_ij - Fatal error!' );
  end

  return
end

