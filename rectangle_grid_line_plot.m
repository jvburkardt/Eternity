function rectangle_grid_line_plot ( nx, ny )

%*****************************************************************************80
%
%% rectangle_grid_line_plot() plots the grid lines of a rectangle object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer NX, the width of the grid, in equilateral triangles.
%
%    integer NY, the height of the grid, in equilateral triangles.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'rectangle_grid_line plot\n' );
  fprintf ( 1, '  Plot the grid lines of a rectangle object.\n' );

  [ w, p_xy ] = rectangle_word ( nx, ny );
%
%  Get the (x,y) coordinates of the boundary nodes.
%
  e = word_to_edge_xy ( w, p_xy );
  en = size ( e, 1 );

  left = p_xy(1,1);
  right = p_xy(1,1) + ( 2 * nx ) * 0.5;
  bottom = p_xy(1,2);
  top = bottom + ny * sqrt ( 3.0 ) / 3.0 + ny * sqrt ( 3.0 ) / 6.0;

  x = linspace ( left, right, 2 * nx + 1 );
  x = x';

  y1 = zeros ( 2 * ny + 1, 1 );
  y1(1) = p_xy(1,2);
  for j = 2 : 4 : 2 * ny + 1
    y1(j)   = y1(j-1) + sqrt ( 3.0 ) / 3.0;
    y1(j+1) = y1(j)   + sqrt ( 3.0 ) / 6.0;
    if ( ( j + 3 ) <= 2 * ny + 1 )
      y1(j+2) = y1(j+1) + sqrt ( 3.0 ) / 6.0;
      y1(j+3) = y1(j+2) + sqrt ( 3.0 ) / 3.0;
    end
  end

  y2 = zeros ( 2 * ny + 1, 1 );
  y2(1) = p_xy(1,2);
  for j = 2 : 4 : 2 * ny + 1
    y2(j)   = y2(j-1) + sqrt ( 3.0 ) / 6.0;
    y2(j+1) = y2(j)   + sqrt ( 3.0 ) / 3.0;
    if ( ( j + 3 ) <= 2 * ny + 1 )
      y2(j+2) = y2(j+1) + sqrt ( 3.0 ) / 3.0;
      y2(j+3) = y2(j+2) + sqrt ( 3.0 ) / 6.0;
    end
  end
%
%  Begin the plot.
%
  figure ( );
  clf ( );
  hold ( 'on' );
%
%  Draw the nodes.
%
  u_ij = rectangle_node_ij ( nx, ny );
  u_xy = node_ij_to_xy ( u_ij, p_xy );

  plot ( u_xy(:,1), u_xy(:,2), 'bo' );
%
%  0 Degree grid lines.
%
  for j = 1 : 2 : 2 * ny + 1
    plot ( [ left, right ], [ y1(j), y1(j) ], 'b-' );
  end
%
%  30 degree grid lines.
%  In this miserable calculation, I gave up on indexing and worked with the
%  raw x and y coordinates.  This means I am liable to roundoff errors
%  when rounding a corner or deciding to stop.  Just great.
%
  xa = right;
  ya = bottom;
  xb = right;
  yb = bottom;

  while ( true )
%
%  A goes left, then up.
%
    if ( left < xa )
      xa = xa - 1.0;
    else
      xa = left;
      ya = ya + sqrt ( 3.0 ) / 3.0;
      if ( top < ya )
        break;
      end
    end
%
%  B goes up, then left.
%
    if ( yb + sqrt ( 3.0 ) / 3.0 <= top )
      yb = yb + sqrt ( 3.0 ) / 3.0;
    else
      if ( yb < top )
        xb = xb + 0.5;
      end
      yb = top;
      xb = xb - 1.0;
      if ( xb < left )
        break;
      end
    end
    plot ( [ xa, xb ], [ ya, yb ], 'b-' );
  end
%
%  60 degree grid lines.
%  In this miserable calculation, we start at the lower left corner.
%  The "A" points move right, first in steps of 2.
%  The "B" points move up, first in steps of 4.
%  When a corner is reached, the stepsize has to change.
%
  ka = 1;
  kb = 1;
 
  while ( ka + 2 <= 2 * nx + 2 * ny )

    ka = ka + 2;
    if ( ka <= 2 * nx + 1 )
      xa = x(ka);
      ya = bottom;
    else
      ka = ka + 2;
      xa = right;
      ya = y1(ka-(2*nx) );
    end

    if ( kb + 4 <= 2 * ny + 1 )
      kb = kb + 4;
      xb = left;
      yb = y1(kb);
    else
      if ( kb < 2 * ny + 1 )
        kb = 2 * ny;
      end
      kb = kb + 2;
      xb = x(kb-2*ny);
      yb = top;
    end
    plot ( [xa,xb], [ya,yb], 'b-' );
  end 
%
%  90 degree grid lines.
%
  for i = 1 : 2 * nx + 1
    plot ( [ x(i), x(i) ], [ bottom, top ], 'b-' );
  end   
%
%  120 degree grid lines.
%  In this miserable calculation, we start at the lower right corner.
%  The "A" points move left, first in steps of 2.
%  The "B" points move up, first in steps of 4.
%  When a corner is reached, the stepsize has to change.
%
  ka = 1;
  kb = 1;
 
  while ( ka + 2 <= 2 * nx + 2 * ny )

    ka = ka + 2;
    if ( ka <= 2 * nx + 1 )
      xa = x(2*nx+2-ka);
      ya = bottom;
    else
      ka = ka + 2;
      xa = left;
      ya = y1(ka-(2*nx) );
    end

    if ( kb + 4 <= 2 * ny + 1 )
      kb = kb + 4;
      xb = right;
      yb = y1(kb);
    else
      if ( kb < 2 * ny + 1 )
        kb = kb + 1;
      end
      kb = kb + 2;
      xb = x(2*ny+1+2*nx+1 - kb);
      yb = top;
    end
    plot ( [xa,xb], [ya,yb], 'b-' );
  end 
%
%  150 degree grid lines.
%  In this miserable calculation, I gave up on indexing and worked with the
%  raw x and y coordinates.  This means I am liable to roundoff errors
%  when rounding a corner or deciding to stop.  Just great.
%
  xa = left;
  ya = bottom;
  xb = left;
  yb = bottom;
  while ( ya < top & xb < right )
    if ( xa < right )
      xa = xa + 1.0;
    else
      xa = right;
      ya = ya + sqrt(3.0) / 3.0;
      if ( top < ya )
        break;
      end
    end
    if ( yb + sqrt(3.0) / 3.0 <= top )
      yb = yb + sqrt(3.0) / 3.0;
    else
      if ( yb < top )
        xb = xb - 0.5;
      end
      yb = top;
      xb = xb + 1.0;
      if ( right < xb )
        break;
      end
    end
    plot ( [ xa, xb ], [ ya, yb ], 'b-' );
  end
%
%  Finish the plot.
%
  hold ( 'off' );
  axis ( 'equal' );
  axis ( 'off' );
  label = sprintf ( 'rectangle %dx%d grid line', nx, ny );
  title ( label );
  filename = sprintf ( 'rectangle_%dx%d_grid_line.png', nx, ny );
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'rectangle_grid_line_plot\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

