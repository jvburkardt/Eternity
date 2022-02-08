function c2 = ch_wrap ( c, clo, chi )

%*****************************************************************************80
%
%% ch_wrap() forces a character to lie between given limits by wrapping.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2020
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character C, a character value.
%
%    character CLO, CHI, the bounds.
%
%  Output:
%
%    character VALUE, a "wrapped" version of the character.
%
  c2 = char ( i4_wrap ( c, clo, chi ) );

  return
end

