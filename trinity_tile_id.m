function eternity_id = trinity_tile_id ( trinity_id )

%*****************************************************************************80
%
%% trinity_tile_id() indexes trinity tiles.
%
%  Discussion:
%
%    This function is given the ID of a Trinity tile, and returns its
%    Eternity ID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 November 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer trinity_ID: a value between 1 and 4, the ID of a trinity tile.
%
%  Output:
%
%    integer ETERNITY_ID: the ID of the corresponding tile in the Eternity
%    catalog.
%
  t2e = [ 210, 211, 212, 213 ];

  eternity_id = t2e ( trinity_id );

  return
end

