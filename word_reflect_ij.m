function [ w2, p2_ij ] = word_reflect_ij ( w, p_ij )

%*****************************************************************************80
%
%% word_reflect_ij() returns the boundary word for a reflected object.
%
%  Discussion:
%
%    This function returns the boundary word for an object reflected
%    across the 90 degree line through the base point.
%
%    The boundary word describes how to trace the boundary of a shape
%    by starting at a base point P and taking a sequence of 
%    steps of varying length in one of 12 directions, as suggested by 
%    this diagram:
%
%      +....+....D....+....+
%      .    E         C    .
%      . F               B .
%      .                   .
%      G         P         A
%      .                   .
%      . H               L .
%      .    I         K    .
%      +....+....J....+....+
%
%    The boundary word specifies a base point P, and then a sequence of
%    directions along which steps are taken.  Because of the geometry,
%    the length of a step varies with the direction and sequence, being 
%    either always 1/2, or else, in measures of 4, 
%    sqrt(3)/3, sqrt(3)/6, sqrt(3)/6, sqrt(3)/3.
%
%    Symbol  Direction  Stepsize
%   
%    A       E          1/2
%    B,b     ENE        sqrt(3)/3, sqrt(3)/6
%    C       NNE        1/2
%    D,d     N          sqrt(3)/3, sqrt(3)/6
%    E       NNW        1/2
%    F,f     WNW        sqrt(3)/3, sqrt(3)/6
%    G       W          1/2
%    H,h     WSW        sqrt(3)/3, sqrt(3)/6
%    I       SSW        1/2
%    J,j     S          sqrt(3)/3, sqrt(3)/6
%    K       SSE        1/2
%    L,l     ESE        sqrt(3)/3, sqrt(3)/6
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
%    character vector W: the boundary word of an object.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%
%  Output:
%
%    character vector W2: the boundary word of the reflected object.
%
%    integer P2_IJ(1,2): the (i,j) coordinates of the base point
%    of the reflected object.
%
  c_old = 'ABbCDdEFfGHhIJjKLl';
  c_new = 'GFfEDdCBbALlKJjIHh';
 
  w2 = s_substitute ( w, c_old, c_new );
  w2 = w2(end:-1:1);

  p2_ij(1,1:2) = p_ij(1,1:2);

  return
end

