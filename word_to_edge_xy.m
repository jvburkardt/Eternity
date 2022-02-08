function e_xy = word_to_edge_xy ( w, p_xy )

%*****************************************************************************80
%
%% word_to_edge_xy(): xy coordinates of the edge nodes of an object.
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
%    integer P_XY(1,2): the (x,y) coordinates of the base point.
%    
%  Output:
%
%    real E_XY(EN,2): the (x,y) coordinates of the edge nodes.
%
  wn = length ( w );

  en = wn;
  e_xy = zeros ( en, 2 );

  e_xy(1,1:2) = p_xy(1,1:2);
 
  for wi = 2 : wn

    c = w(wi-1);

    if ( c == 'A' )
      r = 0.5;
      t =  0.0;
    elseif ( c == 'B' )
      r = sqrt ( 3.0 ) / 3.0;
      t =  1.0 * pi / 6.0;
    elseif ( c == 'b' )
      r = sqrt ( 3.0 ) / 6.0;
      t =  1.0 * pi / 6.0;
    elseif ( c == 'C' )
      r = 0.5;
      t =  2.0 * pi / 6.0;
    elseif ( c == 'D' )
      r = sqrt ( 3.0 ) / 3.0;
      t =  3.0 * pi / 6.0;
    elseif ( c == 'd' )
      r = sqrt ( 3.0 ) / 6.0;
      t =  3.0 * pi / 6.0;
    elseif ( c == 'E' )
      r = 0.5;
      t =  4.0 * pi / 6.0;
    elseif ( c == 'F' )
      r = sqrt ( 3.0 ) / 3.0;
      t =  5.0 * pi / 6.0;
    elseif ( c == 'f' )
      r = sqrt ( 3.0 ) / 6.0;
      t =  5.0 * pi / 6.0;
    elseif ( c == 'G' )
      r = 0.5;
      t =  6.0 * pi / 6.0;
    elseif ( c == 'H' )
      r = sqrt ( 3.0 ) / 3.0;
      t =  7.0 * pi / 6.0;
    elseif ( c == 'h' )
      r = sqrt ( 3.0 ) / 6.0;
      t =  7.0 * pi / 6.0;
    elseif ( c == 'I' )
      r = 0.5;
      t =  8.0 * pi / 6.0;
    elseif ( c == 'J' )
      r = sqrt ( 3.0 ) / 3.0;
      t =  9.0 * pi / 6.0;
    elseif ( c == 'j' )
      r = sqrt ( 3.0 ) / 6.0;
      t =  9.0 * pi / 6.0;
    elseif ( c == 'K' )
      r = 0.5;
      t = 10.0 * pi / 6.0;
    elseif ( c == 'L' )
      r = sqrt ( 3.0 ) / 3.0;
      t = 11.0 * pi / 6.0;
    elseif ( c == 'l' )
      r = sqrt ( 3.0 ) / 6.0;
      t = 11.0 * pi / 6.0;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'word_to_edge_xy(): Fatal error!\n' );
      fprintf ( 1, '  Illegal character in word!\n' );
      fprintf ( 1, '  w(%d) = "%s"\n', wi - 1, c );
      error ( 'word_to_edge_xy(): Fatal error!' ); 
    end

    e_xy(wi,1) = e_xy(wi-1,1) + r * cos ( t );
    e_xy(wi,2) = e_xy(wi-1,2) + r * sin ( t );

  end

  return
end

