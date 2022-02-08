function [ x, y ] = word_to_centroid_ij ( w, p_ij )

%*****************************************************************************80
%
%% word_to_centroid_ij(): centroid of an Eternity object from its boundary word.
%
%  Discussion:
%
%    The Eternity object is assumed to be constructed from 36 congruent 
%    triangles (the same shape and size).  Hence, the centroid is, essentially,
%    simply the average of the vertices of the triangles.
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
%    character W(WN), the boundary word.
%
%    integer P_IJ(1,2): the coordinates of the base point.
%
%  Output:
%
%    integer T2K(T2KN,3), the indices of the nodes forming each triangle.
%
%    integer T2T(T2KN,1), the type of the triangle.
%    1 through 6 describes the rotation, and the sign describes the parity.
%
%    integer W2_IJ(W2N,2), the (i,j) coordinates of the nodes.
%
  [ t2k, t2t, w2 ] = triangle_k ( w, p_ij );
%
%  How many triangles are there?
%
  tn = size ( t2k, 1 );

  x = 0.0;
  y = 0.0;
%
%  For each triangle...
%
  for ti = 1 : tn
%
%  For each node...
%
    for j = 1 : 3
      nj = t2k(ti,j);
      x = x + w2(nj,1);
      y = y + w2(nj,2);
    end
  end
%
%  Average to get centroid.
%
  x = x / 3.0 / tn;
  y = y / 3.0 / tn;

  return
end

