function eternity_id = serenity_tile_id ( serenity_id )

%*****************************************************************************80
%
%% serenity_tile_id() indexes serenity tiles.
%
%  Discussion:
%
%    This function is given the ID of a Serenity tile, and returns its
%    Eternity ID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer SERENITY_ID: a value between 1 and 8, the ID of a serenity tile.
%
%  Output:
%
%    integer ETERNITY_ID: the ID of the corresponding tile in the Eternity
%    catalog.
%
  s2e = [ 214, 215, 216, 217, 218, 219, 220, 221 ];

  eternity_id = s2e ( serenity_id );

  return
end

