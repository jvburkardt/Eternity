function eternity_id = whale_tile_id ( whale_id )

%*****************************************************************************80
%
%% whale_tile_id() indexes whale tiles.
%
%  Discussion:
%
%    Each of the tiles has an index in the list of Eternity tile words.  
%    This function is given a whale tile ID and returns the corresponding
%    ID in the Eternity tile catalog.
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
%    integer whale_ID: a value between 1 and 8, the ID of a whale tile.
%
%  Output:
%
%    integer ETERNITY_ID: the ID of the tile in the Eternity catalog.
%
  w2e = [ 5, 7, 12, 33, 53, 54, 94, 123 ];

  eternity_id = w2e ( whale_id );

  return
end

