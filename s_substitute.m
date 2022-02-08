function s_new = s_substitute ( s_old, sub_old, sub_new )

%*****************************************************************************80
%
%% s_substitute() replaces characters in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2020
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character S_OLD: the string to be modified.
%
%    character SUB_OLD: a list of characters to be replaced.
%    No character should occur twice in this list.
%
%    character SUB_NEW: the list of replacement characters.
%    This array should be the same length as SUB_OLD.
%
%  Output:
%
%    character S_NEW: the string after substitutions.
%
  sn = length ( s_old );

  for si = 1 : sn
    c_old = s_old(si);
    j = find ( c_old == sub_old );
    if ( 0 < j )
      c_new = sub_new(j);
    else
      c_new = s_old(si);
    end
    s_new(si) = c_new;
  end

  return
end


