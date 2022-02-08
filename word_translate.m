function [ w2, p2_xy ] = word_translate ( w, p_xy, s )

%*****************************************************************************80
%
%% word_translate() returns the boundary word for a translated object.
%
%  Discussion:
%
%    The boundary word describes how to trace the boundary of a shape
%    by starting at a base point P, and taking a sequence of 
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
%    integer P_XY(1,2): the (x,y) coordinates of the base point.
%
%    real S(1,2): the translation applied to the object.
%
%  Output:
%
%    character vector W2: the boundary word of the translated object.
%
%    integer P2_XY(1,2): the (x,y) coordinates of the base point
%    of the translated object.
%
  w2 = w;
  p2_xy(1,1:2) = p_xy(1,1:2) + s(1,1:2);

  return
end

