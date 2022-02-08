function e_ij = word_to_edge_ij ( w, p_ij )

%*****************************************************************************80
%
%% word_to_edge_ij(): (i,j) coordinates of the edge nodes of an object.
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
%    character W: the boundary word.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%    
%  Output:
%
%    real E_IJ(EN,2): the (i,j) coordinates of the edge nodes.
%
  wn = length ( w );

  en = wn;
  e_ij = zeros ( en, 2 );

  e_ij(1,1:2) = p_ij(1,1:2);

  for wi = 2 : wn

    c = w(wi-1);

    if ( c == 'A' )
      dx = 2;
      dy = 0;
    elseif ( c == 'B' )
      dx = 2;
      dy = 2;
    elseif ( c == 'b' )
      dx = 1;
      dy = 1;
    elseif ( c == 'C' )
      dx = 1;
      dy = 3;
    elseif ( c == 'D' )
      dx = 0;
      dy = 4;
    elseif ( c == 'd' )
      dx = 0;
      dy = 2;
    elseif ( c == 'E' )
      dx = -1;
      dy =  3;
    elseif ( c == 'F' )
      dx = -2;
      dy =  2;
    elseif ( c == 'f' )
      dx = -1;
      dy =  1;
    elseif ( c == 'G' )
      dx = -2;
      dy =  0;
    elseif ( c == 'H' )
      dx = -2;
      dy = -2;
    elseif ( c == 'h' )
      dx = -1;
      dy = -1;
    elseif ( c == 'I' )
      dx = -1;
      dy = -3;
    elseif ( c == 'J' )
      dx =  0;
      dy = -4;
    elseif ( c == 'j' )
      dx =  0;
      dy = -2;
    elseif ( c == 'K' )
      dx =  1;
      dy = -3;
    elseif ( c == 'L' )
      dx =  2;
      dy = -2;
    elseif ( c == 'l' )
      dx =  1;
      dy = -1;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'word_to_edge_ij - Fatal error!\n' );
       fprintf ( 1, '  Illegal character in word!\n' );
      fprintf ( 1, '  w(%d) = "%s"\n', wi-1, c );
      error ( 'word_to_edge_ij - Fatal error!' ); 
    end

    e_ij(wi,1) = e_ij(wi-1,1) + dx;
    e_ij(wi,2) = e_ij(wi-1,2) + dy;

  end

  return
end

