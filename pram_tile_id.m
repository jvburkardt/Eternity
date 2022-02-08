function eternity_id = pram_tile_id ( pram_id )

%*****************************************************************************80
%
%% pram_tile_id() produces an array to identify Pram tiles as Eternity tiles.
%
%  Discussion:
%
%    Each of the 64 tiles in the Pram tiling problem is a member of the
%    larger set of 209 Eternity tiles.  This function returns an array
%    tile_id_p2e() such that Pram tile i is Eternity tile tile_id_p2d(i).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer PRAM_ID: a value between 1 and 64, the ID of a pram tile.
%
%  Output:
%
%    integer ETERNITY_ID: a value between 1 and 209, the ID of the
%    Eternity tile corresponding to the pram tile.
%
  p2e = [ ...
     1,   2,   3,   5,   6,   7,   9,  11,  12,  14, ... 
    15,  16,  18,  20,  23,  25,  28,  30,  32,  33, ...
    34,  35,  36,  39,  40,  43,  44,  46,  47,  51, ...
    52,  53,  54,  89,  91,  94,  95,  96,  97, 106, ...
   107, 109, 110, 111, 113, 117, 119, 123, 124, 125, ...
   127, 148, 156, 157, 160, 161, 165, 167, 186, 187, ...
   189, 191, 192, 196 ];

  eternity_id = p2e ( pram_id );

  return
end

