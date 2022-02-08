function eternity_id = boomerang_tile_id ( boomerang_id )

%*****************************************************************************80
%
%% boomerang_tile_id() indexes boomerang tiles.
%
%  Discussion:
%
%    Each of the tiles has an index in the list of Eternity tile words.  
%    This function is given a boomerang tile ID and returns the corresponding
%    ID in the Eternity tile catalog.
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
%    integer boomerang_id: the ID of a boomerang tile.
%
%  Output:
%
%    integer ETERNITY_ID: the ID of the tile in the Eternity catalog.
%
  b2e = [  8,  24,  29,  45,  56,  57,  58,  74,  77,  78, ...
          80,  82,  90,  92,  98,  99, 100, 101, 102, 115, ...
         118, 128, 131, 132, 134, 136, 139, 142, 145, 147, ...
         150, 153, 155, 158, 162, 163, 169, 171, 179, 184, ...
         194, 195, 197, 198, 199,  49,  67,  69,  72,  83, ...
          84,  88, 105, 133, 138, 146, 149, 151, 154, 164, ...
         170, 176, 181, 182, 201, 207 ];

  eternity_id = b2e ( boomerang_id );

  return
end

