function [ w, p_ij ] = pram_tile_word ( pram_id )

%*****************************************************************************80
%
%% pram_tile_word() returns the boundary word for a pram tile.
%
%  Discussion:
%
%    The 64 tiles used for the pram tiling problem are taken from the
%    set of 209 tiles used for the Eternity tiling problem.
%
%    For each pram tile, the corresponding index of the Eternity tile
%    is determined.
%
%    Then the eternity_tile_word() function is called to return the
%    boundary word for that tile.
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
%    Devising this data took me three months...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 November 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer pram_id, a tile index.
%
%  Output:
%
%    character W(WN), the boundary word.
%
%    integer P_IJ(2): the (i,j) coordinates of the base point.
%
  eternity_id = pram_tile_id ( pram_id );

  [ w, p_ij ] = eternity_tile_word ( eternity_id );

  return
end

