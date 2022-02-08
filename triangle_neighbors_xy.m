function [ A_xy, B_xy, C_xy ] = triangle_neighbors_xy ( a_xy, b_xy, c_xy )

%*****************************************************************************80
%
%% triangle_neighbors_xy(): neighbor nodes of a 30-60-90 triangle.
%
%  Discussion:
%
%    The (x,y) coordinate system is used.
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
%    01 December 2020
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
%  Output:
%
%    real A_xy(2), B_xy(2), C_xy(2): the (x,y) coordinates of the vertices 
%    defining the neighboring 30-60-90 triangles opposite vertices a,
%    b, and c, respectively.
%

%
%  A helper point.
%
  d_xy = 0.25 * a_xy + 0.75 * b_xy;
%
%  Mirror vertices.
%
  A_xy = 2.0 * c_xy - a_xy;
  B_xy = 2.0 * c_xy - b_xy;
  C_xy = 2.0 * d_xy - c_xy;

  return
end

