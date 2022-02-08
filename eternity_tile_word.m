function [ w, p_ij ] = eternity_tile_word ( k )

%*****************************************************************************80
%
%% eternity_tile_word() returns the boundary word for an eternity tile.
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
%    Devising this data took me three months of painstaking and tedious
%    diagramming and indexing.
%
%    Note that the "base point" is going to be associated with the node
%    where the boundary traversal starts.  For various reasons, this node
%    should actually be a vertex (corner) on the boundary, and it should 
%    be associated with a grid node at which there are 12 equal 30 degree 
%    angles, and not a node associated with 4 90 degree angles or 6 60 
%    degree angles.
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
%    integer K, a tile index.
%
%  Output:
%
%    character W(WN), the boundary word.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%
  p_ij = [ 0, 0 ];

  if ( k == 1 )
    w = 'AAAAAAEEFfIFfIII';
  elseif ( k == 2 )
    w = 'AAAAAADdGGGFfIII';
  elseif ( k == 3 )
    w = 'AAAAAACFfGGFfIII';
  elseif ( k == 4 )
    w = 'AAAAKbBEEGGFfIII';
  elseif ( k == 5 )
    w = 'AAAAAACfFGGEhHII';
  elseif ( k == 6 )
    w = 'AAAAAAEEGGEhHGjJ';
  elseif ( k == 7 )
    w = 'AALlCAADdGGGGGII';
  elseif ( k == 8 )
    w = 'AAAALlCCfFGGGGII';
  elseif ( k == 9 )
    w = 'AALlCAACfFGGGGII';
  elseif ( k == 10 )
    w = 'LlCAAAACfFGGGGII';
  elseif ( k == 11 )
    w = 'AAAACCEhHDdGIIII';
  elseif ( k == 12 )
    w = 'AAAAADdGGDdGIIII';
  elseif ( k == 13 )
    w = 'AAKbBCCGGDdGIIII';
  elseif ( k == 14 )
    w = 'AAAACCGGDdGIIGjJ';
  elseif ( k == 15 )
    w = 'AAAABbEGGCfFIIII';
  elseif ( k == 16 )
    w = 'AALlCCCGGCfFIIII';
  elseif ( k == 17 )
    w = 'AAKbBCCGGCfFIIII';
  elseif ( k == 18 )
    w = 'AAAACCGGCfFIIGjJ';
  elseif ( k == 19 )
    w = 'AAAACCGGCfFHhKII';
  elseif ( k == 20 )
    w = 'AAAACCGdDHhEIIII';
  elseif ( k == 21 )
    w = 'AALlCCCFfIEEIIII';
%
%  Corrected 12 November 2021
%
  elseif ( k == 22 )
    w = 'AAAACCFfIEEIIGjJ';
  elseif ( k == 23 )
    w = 'AAAACCFfIEEHhKII';
  elseif ( k == 24 )
    w = 'LlCAAAdDGGEEIIII';
  elseif ( k == 25 )
    w = 'AAAAAdDGGEEIIHhK';
  elseif ( k == 26 )
    w = 'LlCLlCCCGGEEIIII';
  elseif ( k == 27 )
    w = 'AALlCCCGGEEIIGjJ';
  elseif ( k == 28 )
    w = 'LlCAACCGGEEIIHhK';
  elseif ( k == 29 )
    w = 'LlCAACCGGEEGjJII';
  elseif ( k == 30 )
    w = 'AAAACCGGEEHhKHhK';
  elseif ( k == 31 )
    w = 'AAAACCGGEEGjJHhK';
  elseif ( k == 32 )
    w = 'AAAADdGGGDdGIIKK';
  elseif ( k == 33 )
    w = 'AAAACfFGGDdGIIKK';
  elseif ( k == 34 )
    w = 'AAAAEEGGDdGHhKKK';
  elseif ( k == 35 )
    w = 'AAAAEEFffFIIKK';
  elseif ( k == 36 )
    w = 'AALlCEEGGCfFIIKK';
  elseif ( k == 37 )
    w = 'AAKbBEEGGCfFIIKK';
  elseif ( k == 38 )
    w = 'AAAAEEGGCfFGjJKK';
  elseif ( k == 39 )
    w = 'AAAAEEGdDHhEIIKK';
  elseif ( k == 40 )
    w = 'AAAACfFFfIEEIIKK';
  elseif ( k == 41 )
    w = 'AAKbBEEFfIEEIIKK';
  elseif ( k == 42 )
    w = 'AAAAEEFfIEEIIIlL';
  elseif ( k == 43 )
    w = 'AAAAEEFfIEEGjJKK';
  elseif ( k == 44 )
    w = 'AAAADdGGGEEHhKKK';
  elseif ( k == 45 )
    w = 'AALlCCfFGGEEIIKK';
  elseif ( k == 46 )
    w = 'AAAACfFGGEEGjJKK';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 47 )
    w = 'LlCEEGGEEIIJjAAA';
  elseif ( k == 48 )
    w = 'LlCKbBEEGGEEIIKK';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 49 )
    w = 'AAEEGGEEIIIlLLlC';
  elseif ( k == 50 )
    w = 'LlCAAEEGGEEHhKKK';
  elseif ( k == 51 )
    w = 'BbKCCEEGGGjJKK';
  elseif ( k == 52 )
    w = 'BbKCCEEFfIIIKK';
  elseif ( k == 53 )
    w = 'BbKCCDdGGGIIKK';
  elseif ( k == 54 )
    w = 'BbKCCCfFGGIIKK';
  elseif ( k == 55 )
    w = 'CCKKCCEEGGHhKJjA';
  elseif ( k == 56 )
    w = 'CCKKCCEEGGGjJJjA';
  elseif ( k == 57 )
    w = 'CCKKCCCfFGGIIJjA';
  elseif ( k == 58 )
    w = 'CCKKCCEEGGHhKIlL';
  elseif ( k == 59 )
    w = 'CCKKCCEEGGGjJIlL';
  elseif ( k == 60 )
    w = 'CCKKCCEEEhHIIIlL';
  elseif ( k == 61 )
    w = 'CCKKCCDdGGGIIIlL';
  elseif ( k == 62 )
    w = 'CCKKCCEEFfIHhKKK';
  elseif ( k == 63 )
    w = 'CCKKCCEEEhHHhKKK';
  elseif ( k == 64 )
    w = 'CCKKCCDdGGGHhKKK';
  elseif ( k == 65 )
    w = 'CCKKCCEEEhHGjJKK';
  elseif ( k == 66 )
    w = 'AAAAAdDFfIFfIGjJ';
  elseif ( k == 67 )
    w = 'AAAABbEFfIFfIHhK';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 68 )
    w = 'AABbEGGFfIHhKKbB';
  elseif ( k == 69 )
    w = 'AAAABbEEhHEhHHhK';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 70 )
    w = 'AABbEFfIGGHhKKbB';
  elseif ( k == 71 )
    w = 'AAAABbEFfIFfIGjJ';
  elseif ( k == 72 )
    w = 'AAKbBBbEGGFfIGjJ';
  elseif ( k == 73 )
    w = 'KbBAABbEGGFfIGjJ';
  elseif ( k == 74 )
    w = 'AAAABbEFfIEhHGjJ';
  elseif ( k == 75 )
    w = 'KbBKbBBbEGGGGGjJ';
  elseif ( k == 76 )
    w = 'LlCAACCFfIFfIGjJ';
  elseif ( k == 77 )
    w = 'AAKbBCCFfIEhHGjJ';
  elseif ( k == 78 )
    w = 'AALlCCCEhHEhHGjJ';
  elseif ( k == 79 )
    w = 'KbBLlCCCGGEhHGjJ';
  elseif ( k == 80 )
    w = 'KbBKbBCCFfIGGGjJ';
  elseif ( k == 81 )
    w = 'AALlCCCFfIFfIHhK';
  elseif ( k == 82 )
    w = 'AALlCCCEhHFfIHhK';
  elseif ( k == 83 )
    w = 'LlCAACCFfIEhHHhK';
  elseif ( k == 84 )
    w = 'AAKbBCCEhHEhHHhK';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 85 )
    w = 'LlCCCFfIGGHhKKbB';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 86 )
    w = 'KbBCCFfIGGHhKKbB';
  elseif ( k == 87 )
    w = 'LlCKbBCCEhHGGHhK';%
%  Corrected, 26 October 2021.
%
  elseif ( k == 88 )
    w = 'KbBCCEhHGGHhKKbB';
  elseif ( k == 89 )
    w = 'AAEEGGGGJjjJBbbB';
%
%  Corrected 30 October 2021
%
  elseif ( k == 90 )
    w = 'AjJBbbBCfFGGGGKK';
%
%  Corrected 30 October 2021
%
  elseif ( k == 91 )
    w = 'AjJBbbBDdGGGGGKK';
  elseif ( k == 92 )
    w = 'AjJBbbBEEGGEhHKK';
  elseif ( k == 93 )
    w = 'AjJBbbBEEGGFfIKK';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 94 )
    w = 'BbbBEEGGGGJjAAjJ';
  elseif ( k == 95 )
    w = 'AjJBbbBBbEGGGGII';
  elseif ( k == 96 )
    w = 'AjJBbbBAdDGGGGII';
  elseif ( k == 97 )
    w = 'LlIAADdACCGGGGII';
  elseif ( k == 98 )
    w = 'KbBKbBCfFEEIIGjJ';
  elseif ( k == 99 )
    w = 'KbBKbBDdGEEGjJII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 100 )
    w = 'LlCEECfFIIHhKKbB';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 101 )
    w = 'LlCDdGEEIIHhKKbB';
  elseif ( k == 102 )
    w = 'LlCKbBEEDdGHhKII';
  elseif ( k == 103 )
    w = 'AAAADdGDdGHhKHhK';
  elseif ( k == 104 )
    w = 'AAAADdGCfFHhKHhK';
  elseif ( k == 105 )
    w = 'AAAADdGDdGHhKGjJ';
  elseif ( k == 106 )
    w = 'AjJBbbBEEEEIIHhK';
  elseif ( k == 107 )
    w = 'AjJBbbBEEEEIIGjJ';
  elseif ( k == 108 )
    w = 'AjJBbbBEEEEHhKII';
%
%  Corrected 30 October 2021
%
  elseif ( k == 109 )
    w = 'AjJBbbBEEEEGjJII';
  elseif ( k == 110 )
    w = 'AjJBbbBEEDdGIIII';
  elseif ( k == 111 )
    w = 'AjJBbbBDdGEEIIII';
  elseif ( k == 112 )
    w = 'KKAdDLlCDdGFfIII';
  elseif ( k == 113 )
    w = 'KKAdDLlCCfFFfIII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 114 )
    w = 'AdDLlCEEFfIHhKKK';
  elseif ( k == 115 )
    w = 'KKAdDLlCCfFEhHII';
  elseif ( k == 116 )
    w = 'JjAAdDLlCEEEhHII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 117 )
    w = 'AdDLlCEEEhHIIIlL';
  elseif ( k == 118 )
    w = 'JjAAdDLlCDdGGGII';
  elseif ( k == 119 )
    w = 'KKBbbBDdGFfIII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 120 )
    w = 'BbbBEEFfIIIIlL';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 121 )
    w = 'BbbBEEFfIHhKKK';
  elseif ( k == 122 )
    w = 'KKBbbBDdGEhHII';
  elseif ( k == 123 )
    w = 'KKBbbBCfFEhHII';
  elseif ( k == 124 )
    w = 'JjABbbBEEEhHII';
  elseif ( k == 125 )
    w = 'JjABbbBDdGGGII';
  elseif ( k == 126 )
    w = 'KKClLDdADdGFfIII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 127 )
    w = 'ClLDdAEEFfIIIIlL';
  elseif ( k == 128 )
    w = 'KKClLDdACfFEhHII';
  elseif ( k == 129 )
    w = 'JjAClLDdAEEEhHII';
  elseif ( k == 130 )
    w = 'JjACCLlCDdGFfIII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 131 )
    w = 'CCLlCDdGFfIIIILl';
  elseif ( k == 132 )
    w = 'KKCCLlCDdGFfIGjJ';
%
%  Corrected, 26 October 2021.
%  Recorrected, 20 November 2021...
%
  elseif ( k == 133 )
%   w = 'CClLCCfFFfIHhKKK';
    w = 'CCLlCCfFFfIHhKKK';
  elseif ( k == 134 )
    w = 'KKCClLCCfFFfIGjJ';
  elseif ( k == 135 )
    w = 'JjACCLlCCfFEhHII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 136 )
    w = 'CCLlCCfFEhHIIILl';
  elseif ( k == 137 )
    w = 'KKCCLlCCfFEhHGjJ';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 138 )
    w = 'CCLlCEEFfIGjJJjA';
  elseif ( k == 139 )
    w = 'IlLCCLlCEEFfIHhK';
  elseif ( k == 140 )
    w = 'IlLCCLlCEEFfIGjJ';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 141 )
    w = 'CCLlCEEEhHGjJJjA';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 142 )
    w = 'CCKbBCfFFfIIIIlL';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 143 )
    w = 'CCKbBDdGFfIHhKKK';
  elseif ( k == 144 )
    w = 'IlLCCKBbEEFfIGjJ';
  elseif ( k == 145 )
    w = 'JjACCKBbEEEhHHhK';
  elseif ( k == 146 )
    w = 'IlLCCKBbEEEhHHhK';
  elseif ( k == 147 )
    w = 'JjACCAACfFFfIHhK';
  elseif ( k == 148 )
    w = 'LllLCCAAEEGGHhhH';
  elseif ( k == 149 )
    w = 'LllLDdADdGFfIHhK';
  elseif ( k == 150 )
    w = 'LllLDdADdGFfIGjJ';
  elseif ( k == 151 )
    w = 'LllLDdACfFFfIGjJ';
  elseif ( k == 152 )
    w = 'AAKbBCfFFffFJjjJ';
  elseif ( k == 153 )
    w = 'LlCAACfFFffFJjjJ';
  elseif ( k == 154 )
    w = 'KbBAACfFFffFJjjJ';
  elseif ( k == 155 )
    w = 'KbBLlCEEFffFJjjJ';
  elseif ( k == 156 )
    w = 'KbBAjJBbbBFffFGGII';
  elseif ( k == 157 )
    w = 'AALllLDddDHhEEhHII';
  elseif ( k == 158 )
    w = 'AAKbBCFfGdDHhhHLlI';
  elseif ( k == 159 )
    w = 'AAAjJBbKCCFffFGGII';
  elseif ( k == 160 )
    w = 'AAAADdAEEGGKhHII';
  elseif ( k == 161 )
    w = 'AAAAEbBEEGGKhHII';
  elseif ( k == 162 )
    w = 'KbBClLBbEGdDHhhHII';
  elseif ( k == 163 )
    w = 'AAClLAdDGdDHhhHHhK';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 164 )
    w = 'ClLCCGdDHhhHHhKKbB';
  elseif ( k == 165 )
    w = 'LlCEbBDdGFfIJjjJ';
  elseif ( k == 166 )
    w = 'KbBEbBFfCFfIJjGIlL';
  elseif ( k == 167 )
    w = 'AALlCEEGdDGGJjjJ';
  elseif ( k == 168 )
    w = 'KbBAAEEGdDGGJjjJ';
  elseif ( k == 169 )
    w = 'AALlCEEFfCGGJjjJ';
  elseif ( k == 170 )
    w = 'AjJAADdAEEFfIHhK';
  elseif ( k == 171 )
    w = 'AjJAADdAEEEhHHhK';
  elseif ( k == 172 )
    w = 'AjJAADdAEEFfIGjJ';
  elseif ( k == 173 )
    w = 'AjJAAEbBEEFfIHhK';
  elseif ( k == 174 )
    w = 'AjJAAEbBEEFfIGjJ';
  elseif ( k == 175 )
    w = 'AjJAAEbBDdGGGGjJ';
  elseif ( k == 176 )
    w = 'AjJAAEbBCfFFfIII';
  elseif ( k == 177 )
    w = 'AjJAAEbBCfFEhHII';
  elseif ( k == 178 )
    w = 'AjJLlCEbBEEFfIII';
  elseif ( k == 179 )
    w = 'AjJLlCEbBCfFGGII';
  elseif ( k == 180 )
    w = 'KbBClLDdADdGHhhHII';
  elseif ( k == 181 )
    w = 'LlCBbbBEEHhhHHhK';
  elseif ( k == 182 )
    w = 'AjJAAEbBBbEGGIfFII';
  elseif ( k == 183 )
    w = 'AjJAAEbBAdDGGIfFII';
  elseif ( k == 184 )
    w = 'LlCAAEbBEEIfFJjGII';
  elseif ( k == 185 )
    w = 'KbBAAEbBEEIfFJjGII';
  elseif ( k == 186 )
    w = 'AALlCDdAEEHhhHII';
  elseif ( k == 187 )
    w = 'AAKbBDdAEEHhhHII';
  elseif ( k == 188 )
    w = 'AAAADdAEEHhhHHhK';
  elseif ( k == 189 )
    w = 'AAAADdAEEHhhHGjJ';
  elseif ( k == 190 )
    w = 'KbBAAEbBEEHhhHII';
  elseif ( k == 191 )
    w = 'AAAAEbBEEHhhHHhK';
  elseif ( k == 192 )
    w = 'AAAAEbBEEHhhHGjJ';
  elseif ( k == 193 )
    w = 'AAClLCCCfFHhhHII';
  elseif ( k == 194 )
    w = 'AAClLCCEEHhhHHhK';
  elseif ( k == 195 )
    w = 'AABbKCCDdGHhhHII';
  elseif ( k == 196 )
    w = 'AABbKBbEEEHhhHII';
  elseif ( k == 197 )
    w = 'AABbKAdDEEHhhHII';
  elseif ( k == 198 )
    w = 'LlCBbKCCEEHhhHII';
  elseif ( k == 199 )
    w = 'KbBBbKCCEEHhhHII';
  elseif ( k == 200 )
    w = 'AABbKCCEEHhhHHhK';
  elseif ( k == 201 )
    w = 'AABbKBbEEEIfFJjGII';
  elseif ( k == 202 )
    w = 'KKClLBbEDdGIfFII';
  elseif ( k == 203 )
    w = 'KKClLAdDDdGIfFII';
%
%  Corrected, 26 October 2021.
%
  elseif ( k == 204 )
    w = 'ClLCCDdGIfFIIIlL';
  elseif ( k == 205 )
    w = 'KKClLBbECfFIfFII';
  elseif ( k == 206 )
    w = 'KKClLBbEEEIfFGjJ';
  elseif ( k == 207 )
    w = 'KKBbKBbEDdGIfFII';
  elseif ( k == 208 )
    w = 'JjABbKCCDdGIfFII';
  elseif ( k == 209 )
    w = 'JjABbKCCCfFIfFII';
%
%  Tiles 210-213 are from the "Trinity" puzzle mentioned in a talk
%  by Alex Selby.
%
  elseif ( k == 210 )
    w = 'AAKbBCCGGDdGIIII';
  elseif ( k == 211 )
    w = 'AALlCCfFGGEEIIKK';
  elseif ( k == 212 )
    w = 'AALlCEEGGCfFIIKK';
  elseif ( k == 213 )
    w = 'AAAADdAEEGGKhHII';
%
%  Tiles 214-221 are from the "Serenity" puzzle.
%
  elseif ( k == 214 )
    w = 'AADdGCCEhHHhKIlL';
  elseif ( k == 215 )
    w = 'AjJBbbBCCFfIGGII';
  elseif ( k == 216 )
    w = 'KbBEbBBbEGGIfFJjjJ';
  elseif ( k == 217 )
    w = 'AAEEEEHhEHhKLllL';
  elseif ( k == 218 )
    w = 'AAEEAAEEEEHhKKhHKK';
  elseif ( k == 219 )
    w = 'LlCEEBbEEhHIIJjA';
  elseif ( k == 220 )
    w = 'LlCEbBEEIfFGjJKK';
  elseif ( k == 221 )
    w = 'GGKKBbbBBbEEhHGGKK';
%
%  Unrecognized tile index.
%
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'eternity_tile_word() - Fatal error!\n' );
    fprintf ( 1, '  Illegal tile index %d\n', i );
    error ( 'eternity_tile_word() - Fatal error!\n' );
  end

  return
end

