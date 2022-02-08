function area = word_area ( w, p_ij )

%*****************************************************************************80
%
%% word_area() returns the area of a polygon from its boundary word.
%
%  Discussion:
%
%    The area is measured in terms of the number of elementary triangles.
%    The standard Eternity tiles should each have an area of 36.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character W(WN), the boundary word.
%
%    integer P_IJ(1,2): the (i,j) coordinates of the base point.
%
%  Output:
%
%    integer AREA: the area of the object, as the number of elementary triangles.
%

%
%  Retrieve the indices of the nodes making up each triangle.
%
  [ tk, tt, w2_ij ] = triangle_k ( w, p_ij );
%
%  The area can be determined simply from the first dimension of TK.
%
  area = size ( tk, 1 );

  return
end

