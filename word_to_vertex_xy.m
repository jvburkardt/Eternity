function v_xy = word_to_vertex_xy ( w, p_xy )

%*****************************************************************************80
%
%% word_to_vertex_xy(): boundary word -> (x,y) coordinates of vertices.
%
%  Discussion:
%
%    The boundary word describes how to trace the boundary of a shape
%    by starting at a base point P = (i,j), and taking a sequence of 
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
%    character w: the boundary word.
%
%    integer P_XY(1,2): the (x,y) coordinates of the base point.
%    
%  Output:
%
%    real V_XY(VN,2), the (x,y) coordinates of the vertices.
%
  wn = length ( w );
  e = word_to_edge_xy ( w, p_xy );

  vn = 0;
  v_xy = zeros ( vn, 2 );
  c2 = upper ( w(wn) );

  for wi = 1 : wn
    c1 = c2;    
    c2 = upper ( w(wi) );
    if ( c2 ~= c1 )
      vn = vn + 1;
      v_xy(vn,1:2) = e(wi,1:2);
    end
  end      

  return
end

