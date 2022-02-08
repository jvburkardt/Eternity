function [ w, p_ij ] = rectangle_word ( nx, ny )

%*****************************************************************************80
%
%% rectangle_word() returns the boundary word for a rectangle grid.
%
%  Discussion:
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
%    12 March 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer NX, the width of the grid, in equilateral triangles.
%
%    integer NY, the height of the grid, in equilateral triangles.
%
%  Output:
%
%    character vector W: the boundary word.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%
  p_ij = [ 0, 0 ];

  w = '';

  for i = 1 : nx
    w = [ w, 'AA' ];
  end

  for j = 1 : ny
    if ( mod ( j, 2 ) == 1 )
      w = [ w, 'Dd' ];
    else
      w = [ w, 'dD' ];
    end
  end

  for i = nx : -1 : 1
    w = [ w, 'GG' ];
  end

  for j = ny : -1 : 1
    if ( mod ( j, 2 ) == 1 )
      w = [ w, 'jJ' ];
    else
      w = [ w, 'Jj' ];
    end 
  end

  return
end

