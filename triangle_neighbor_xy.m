function [ ak_xy, bk_xy, ck_xy ] = triangle_neighbor_xy ( a_xy, b_xy, c_xy, k )

%*****************************************************************************80
%
%% triangle_neighbor_xy() computes (x,y) coordinates of a triangle neighbor.
%
%  Discussio:
%
%    This function computes the (x,y) coordinates of the vertices of one of
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
%    real a_xy(2), b_xy(2), c_xy(2): the (x,y) coordinates of the vertices of
%    a 30-60-90 triangle.  Vertices a, b, and c are associated with the
%    30, 60, and 90 degree angles, respectively.
%
%    integer k: indicates the neighbor triangle:
%    1, 2, 3 means opposite the 30, 60, or 90 degree vertex respectively.
%
%  Output:
%
%    real ak_xy(2), bk_xy(2), ck_xy(2): the (x,y) coordinates of the vertices 
%    defining the neighboring 30-60-90 triangles opposite vertices a,
%    b, and c, respectively.
%
  if ( k == 1 )
    ak_xy = 2.0 * c_xy - a_xy;
    bk_xy = b_xy;
    ck_xy = c_xy;
  elseif ( k == 2 )
    ak_xy = a_xy;
    bk_xy = 2.0 * c_xy - b_xy;
    ck_xy = c_xy;
  elseif ( k == 3 )
    ak_xy = a_xy;
    bk_xy = b_xy;
    dk_xy = ( a_xy + 3.0 * b_xy ) / 4.0;
    ck_xy = 2.0 * dk_xy - c_xy;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'triangle_neighbor_xy - Fatal error!\n' );
    fprintf ( 1, '  Illegal neighbor index k = %d\n', k );
    error ( 'triangle_neighbor_xy - Fatal error!' );
  end

  return
end

