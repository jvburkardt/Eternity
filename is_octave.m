function value = is_octave ( )

%*****************************************************************************80
%
%% is_octave() returns true if Octave has called this function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2019
%
%  Author:
%
%    John Burkardt
%
%  Output:
%
%    logical VALUE: is true if Octave is calling.
%
  persistent cacheval;

  if ( isempty ( cacheval ) )
    cacheval = ( exist ( "OCTAVE_VERSION", "builtin" ) > 0 );
  end

  value = cacheval;

  return
end
