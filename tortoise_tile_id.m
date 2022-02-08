function eternity_id = tortoise_tile_id ( tortoise_id )

%*****************************************************************************80
%
%% tortoise_tile_id() indexes tortoise tiles.
%
%  Discussion:
%
%    Each of the tiles in the Pram tiling problem has an index in the
%    list of Eternity tile words.  This function returns an array
%    tile_id_t2e() such that tortoise tile i is Eternity tile tile_id_t2e(i).
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
%    integer tortoise_ID: the ID of a tortoise tile.
%
%  Output:
%
%    integer ETERNITY_ID: the ID of the corresponding tile in the Eternity
%    catalog.
%
  t2e = [   8,  24,  29,  45,  56,  57,  58,  74,  77,  78, ...
           80,  82,  90,  92,  98,  99, 100, 101, 102, 115, ...
          118, 128, 131, 132, 134, 136, 139, 142, 145, 147, ...
          150, 153, 155, 158, 162, 163, 169, 171, 179, 184, ...
          194, 195, 197, 198, 199 ];

  eternity_id = t2e ( tortoise_id );

  return
end

