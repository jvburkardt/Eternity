function inside = polygon_contains_point ( p, q )

%*****************************************************************************80
%
%% polygon_contains_point() finds if a point is inside a simple polygon.
%
%  Discussion:
%
%    A simple polygon is one whose boundary never crosses itself.
%    The polygon does not need to be convex.
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
%  Reference:
%
%    M Shimrat,
%    Position of Point Relative to Polygon,
%    ACM Algorithm 112,
%    Communications of the ACM,
%    Volume 5, Number 8, page 434, August 1962.
%
%  Input:
%
%    real P(N,2): the coordinates of the vertices of the polygon.
%
%    real Q(1,2): the coordinates of the point to be tested.
%
%  Output:
%
%    logical INSIDE: TRUE if the point is inside the polygon.
%
  inside = false;

  n = size ( p, 1 );

  x1 = p(n,1);
  y1 = p(n,2);

  for i = 1 : n

    x2 = p(i,1);
    y2 = p(i,2);

    if ( ( y1 < q(1,2) & q(1,2) <= y2 ) | ( q(1,2) <= y1 & y2 < q(1,2) ) )
      if ( ( q(1,1) - x1 ) - ( q(1,2) - y1 ) * ( x2 - x1 ) / ( y2 - y1 ) <= 0.0 )
        inside = ~ inside;
      end
    end

    x1 = x2;
    y1 = y2;

  end
%
%  Extra care needed to handle points on the boundary.
%  And we can only be sure if we are doing integer (i,j) coordinates.
%
  x1 = p(n,1);
  y1 = p(n,2);

  for i = 1 : n

    x2 = p(i,1);
    y2 = p(i,2);
%
%  Is it on the line?
%
    if ( ( q(1,2) - y1 ) * ( x2 - x1 ) == ( y2 - y1 ) * ( q(1,1) - x1 ) )
%
%  Is it between the two nodes?
%
      if ( x1 == x2 )
        if ( ( y1 <= q(1,2) & q(1,2) <= y2 ) | ( y2 <= q(1,2) & q(1,2) <= y1 ) )
          inside = true;
        end
      elseif ( y1 == y2 )
        if ( ( x1 <= q(1,1) & q(1,1) <= x2 ) | ( x2 <= q(1,1) & q(1,1) <= x1 ) )
          inside = true;
        end
      else
        rx = ( q(1,1) - x1 ) / ( x2 - x1 );
        ry = ( q(1,2) - y1 ) / ( y2 - y1 );
        if ( 0.0 <= rx & rx <= 1.0 & 0.0 <= ry & ry <= 1.0 )
          inside = true;
        end
      end

    end
    x1 = x2;
    y1 = y2;
  end

  return
end
