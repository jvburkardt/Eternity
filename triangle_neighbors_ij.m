function [ A_ij, B_ij, C_ij ] = triangle_neighbors_ij ( a_ij, b_ij, c_ij )

%*****************************************************************************80
%
%% triangle_neighbors_ij(): neighbor nodes of a 30-60-90 triangle.
%
%  Discussion:
%
%    The (i,j) coordinate system is used.
%
%    Given triangle abc, the neighboring triangles have vertices:
%
%      Abc
%      aBc
%      abC
%
%    where A, B, and C are to be determined.
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
%  Output:
%
%    real A_ij(2), B_ij(2), C_ij(2): the (i,j) coordinates of the vertices 
%    defining the neighboring 30-60-90 triangles opposite vertices a,
%    b, and c, respectively.
%

%
%  A helper point.
%
  d_ij = ( a_ij + 3 * b_ij ) / 4;
%
%  Mirror vertices.
%
  A_ij = 2 * c_ij - a_ij;
  B_ij = 2 * c_ij - b_ij;
  C_ij = 2 * d_ij - c_ij;

  return
end

