function col = type_to_color ( tt )

%*****************************************************************************80
%
%% type_to_color() translates an element type to a color index.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 April 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer TT: the element type.
%    The magnitude, between 1 and 6, indicates the rotation.
%    The sign indicates the parity.
%
%  Output:
%
%    integer COL: the color index.
%
  if ( -6 <= tt & tt < 0 )
    col = tt + 13;
  elseif ( 0 < tt & tt <= 6 )
    col = tt;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'type_to_color: Fatal error!\n' );
    fprintf ( 1, '  Illegal type value = %d\n', tt );
    error ( 'type_to_color: Fatal error!\n' );
  end

  return
end

