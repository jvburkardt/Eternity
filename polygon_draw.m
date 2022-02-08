function polygon_draw ( v )

%*****************************************************************************80
%
%% polygon_draw() draws the outline of a polygon.
%
%  Discussion:
%
%    This function can display a polygon given its (i,j) or (x,y) coordinates.
%
%    When drawing an object, this function might be called first, to
%    display the boundary, after which further details can be added.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    real V(VN,2), the (i,j) or (x,y) coordinates of the vertices.
%
  vn = size ( v, 1 );

  r = v(vn,1:2);
  for vi = 1 : vn
    q = r;
    r = v(vi,1:2);
    plot ( [ q(1), r(1)], [ q(2), r(2) ], 'm-', 'linewidth', 3 );
  end

  return
end

