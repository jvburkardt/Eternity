function [ w2, p2_xy ] = word_reverse ( w, p_xy )

%*****************************************************************************80
%
%% word_reverse() returns the boundary word for a "reversed" object.
%
%  Discussion:
%
%    Normally, we expect the boundary word to trace out the boundary of an
%    object in the counter-clockwise direction, starting at the base point P.
%    Of course, we could just as well start at P, and travel around the
%    boundary in the clockwise direction.
%
%    This function takes a boundary word, and returns the boundary word that
%    traverses the boundary in the opposite sense.
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
%    character vector W: the boundary word.
%
%    integer P_XY(1,2): the (x,y) coordinates of the base point.
%
%  Output:
%
%    character vector W2: the boundary word of the reversed object.
%
%    integer P2_XY(1,2): the (x,y) coordinates of the base point
%    of the reversed object.
%
  p2_xy(1,1:2) = p_xy(1,1:2);

  sub_old = 'ABbCDdEFfGHhIJjKLl';
  sub_new = 'GHhIJjKLlABbCDdEFf';

  w2 = s_substitute ( w, sub_old, sub_new );

  w2 = w2(end:-1:1);

  return
end

