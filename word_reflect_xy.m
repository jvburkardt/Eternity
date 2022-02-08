function [ w2, p2_xy ] = word_reflect_xy ( w, p_xy, r_angle )

%*****************************************************************************80
%
%% word_reflect_xy() returns the boundary word for a reflected object.
%
%  Discussion:
%
%    This function returns the boundary word for an object reflected
%    across the 0, 30, 60, 90, 120, or 150 degree line through the base point.
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
%    integer P_XY(1,2): the (x,y) coordinates of the base point.
%
%    integer R_ANGLE, the angle associated with the rotation:
%    0, 30, 60, 90, 120, 150.
%
%  Output:
%
%    character vector W2: the boundary word of the reflected object.
%
%    integer P2_XY(1,2): the (x,y) coordinates of the base point
%    of the reflected object.
%
  r_angle = mod ( r_angle, 180 );

  c_old = 'ABbCDdEFfGHhIJjKLl';

  if ( r_angle == 0 )
    c_new = 'GFfEDdCBbALlKJjIHh';
  elseif ( r_angle == 30 )
    c_new = 'IHhGFfEDdCBbALlKJj';
  elseif ( r_angle == 60 )
    c_new = 'KJjIHhGFfEDdCBbALl';
  elseif ( r_angle == 90 )
    c_new = 'ALlKJjIHhGFfEDdCBb';
  elseif ( r_angle == 120 )
    c_new = 'CBbALlKJjIHhGFfEDd';
  elseif ( r_angle == 150 )
    c_new = 'EDdCBbALlKJjIHhGFf';
  end
  
  w2 = s_substitute ( w, c_old, c_new );
  w2 = w2(end:-1:1);

  p2_xy(1,1:2) = p_xy(1,1:2);

  return
end

