function eternity_id = boat_tile_id ( boat_id )

%*****************************************************************************80
%
%% boat_tile_id() indexes boat tiles.
%
%  Discussion:
%
%    Each of the tiles has an index in the list of Eternity tile words.  
%    This function is given a boat tile ID and returns the corresponding
%    ID in the Eternity tile catalog.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer boat_ID: the ID of a boat tile.
%
%  Output:
%
%    integer ETERNITY_ID: the ID of the tile in the Eternity catalog.
%
  b2e = [ 49,  67,  69,  72,  83,  84,  88, 105, 133, 138, ...
         146, 149, 151, 154, 164, 170, 176, 181, 182, 201, ...
         207 ];
 
  eternity_id = b2e ( boat_id );

  return
end

