function value = chvec_lt ( c1, c2 )

%*****************************************************************************80
%
%% chvec_lt is TRUE if one character vector is less than another.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2020
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    char C1(N1), C2(N2), two character vectors.
%
%  Output:
%
%    logical VALUE: is TRUE if C1 < C2.
%
  value = true;

  n1 = length ( c1 );
  n2 = length ( c2 );
  n = min ( n1, n2 );

  for i = 1 : n

    if ( c1(i) < c2(i) )
      value = true;
      return;
    elseif ( c1(i) > c2(i) )
      value = false;
      return
    end

  end

  if ( n1 < n2 )
    value = true;
  else
    value = false;
  end

  return
end
