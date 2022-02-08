function w_rep = word_representative ( w )

%*****************************************************************************80
%
%% word_representative() finds the representative for a boundary word.
%
%  Discussion:
%
%    Mathematically, a boundary word is a "necklace", that is, an equivalence
%    class of strings of characters, invariant under rotation.  Thus,
%    the following five boundary words are in the same equivalence class:
%      'abcde', 'bcdea', 'cdeab', 'deabc', 'eabcd' 
%
%    This function is given a boundary word, and returns the representative
%    for the class, that is, the lexically first element.
%
%    MATLAB makes lexical comparison easy for strings, which are 
%    actually distinct from character arrays.  We assume the user is
%    working with strings, and so we have to internally convert back
%    and forth.
%
%    Two boundary words are equal if and only if they have the same representative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    char w(*): a boundary word.
%
%  Output:
%
%    char w_rep(*): the representative for the boundary word.
%
  wn = length ( w );

  if ( is_octave )

    for i = 1 : wn
      if ( i == 1 )
        w1 = w;
        w_rep = w;
      else
        w1 = [ w1(2:wn), w1(1) ];
        if ( chvec_lt ( w1, w_rep ) )
          w_rep = w1;
        end
      end
    end

  else

    for i = 1 : wn
      if ( i == 1 )
        w1 = w;
        s_rep = string ( w );
      else
        w1 = [ w1(2:wn), w1(1) ];
        s1 = string ( w1 );
        if ( upper ( s1 ) < upper ( s_rep ) )
          s_rep = s1;
        end
      end
    end

    w_rep = char ( s_rep );

  end

  return
end
 
