function [ tk, tt ] = rectangle_triangle_k ( nx, ny )

%*****************************************************************************80
%
%% rectangle_triangle_k(): nodes forming each triangle in a rectangle object.
%
%  Discussion:
%
%    The number of nodes will be NN = NX*(2+6*NY)+(1+2*NY).
%
%    The number of triangles will be WN = 12*NX*NY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2021
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
%  Output:
%
%    integer TK(TN,3): TK(I,J) indexes the J-th node of 
%    the I-th 30-60-90 triangle.
%
%    integer TT(TN,1), the type of the triangle.
%    1 through 6 describes the rotation, and the sign describes the parity.
%
  nn = nx * ( 2 + 6 * ny ) + ( 1 + 2 * ny );
  tn = 12 * nx * ny;
  tk = zeros ( tn, 3 );
  tt = zeros ( tn, 1 );
%
%  Index of the current triangle.
%
  it = 0;
%
%  Work on the next big column.
%
  for col = 1 : nx
%
%  Work on the next big row.
%
    for row = 1 : ny
%
%  Depending on row and column, determine the indices of the 11 nodes
%  in the current subrectangle.
%
      if ( col == 1 & row == 1 )
        n1 = 1;
        n4 = n1 + 1 + 2 * ny;
        n5 = n1 + 1 + 3 * ny;
        n8 = n1 + 2 + 5 * ny;
        n9 = n1 + 2 + 6 * ny;
      elseif ( col == 1 & 1 < row )
        n1 = n3;
        n4 = n4 + 1;
        n5 = n7;
        n8 = n8 + 1;
        n9 = n11;
      elseif ( 1 < col & 1 == row )
        n1 = ( col - 1 ) * ( 2 + 6 * ny ) + 1;
        n4 = n1 + 1 + 2 * ny;
        n5 = n1 + 1 + 3 * ny;
        n8 = n1 + 2 + 5 * ny;
        n9 = n1 + 2 + 6 * ny;
      elseif ( 1 < col & 1 < row )
        n1 = n3;
        n4 = n4 + 1;
        n5 = n7;
        n8 = n8 + 1;
        n9 = n11;
      end

      n2 = n1 + 1;
      n3 = n2 + 1;

      n6 = n5 + 1;
      n7 = n6 + 1;

      n10 = n9 + 1;
      n11 = n10 + 1;
%
%  The triangle pattern "flips" vertically as we move up a row.
%
      if ( mod ( row, 2 ) == 1 )

        tk(it+1,1:3)  = [ n1, n2,  n4 ];
        tt(it+1,1)    = 2;
        tk(it+2,1:3)  = [ n1, n6,  n4 ];
        tt(it+2,1)    = -6;
        tk(it+3,1:3)  = [ n1, n6,  n5 ];
        tt(it+3,1)    = 1;

        tk(it+4,1:3)  = [ n9, n6,  n5 ];
        tt(it+4,1)    = -4;
        tk(it+5,1:3)  = [ n9, n6,  n8 ];
        tt(it+5,1)    = 3;
        tk(it+6,1:3)  = [ n9, n10, n8 ];
        tt(it+6,1)    = -5;

        tk(it+7,1:3)  = [ n7, n10, n11 ];
        tt(it+7,1)    = -1;
        tk(it+8,1:3)  = [ n7, n10, n8 ];
        tt(it+8,1)    = 6;
        tk(it+9,1:3)  = [ n7, n6,  n8 ];
        tt(it+9,1)    = -2;
        tk(it+10,1:3) = [ n7, n6,  n4 ];
        tt(it+10,1)   = 5;
        tk(it+11,1:3) = [ n7, n2,  n4 ];
        tt(it+11,1)   = -3;
        tk(it+12,1:3) = [ n7, n2,  n3 ];
        tt(it+12,1)   = 4;

      else

        tk(it+1,1:3)  = [ n5,  n2,  n1 ];
        tt(it+1,1)    = -4;
        tk(it+2,1:3)  = [ n5,  n2,  n4 ];
        tt(it+2,1)    = 3;
        tk(it+3,1:3)  = [ n5,  n6,  n4 ];
        tt(it+3,1)    = -5;
        tk(it+4,1:3)  = [ n5,  n6,  n8 ];
        tt(it+4,1)    = 2;
        tk(it+5,1:3)  = [ n5,  n10, n8 ];
        tt(it+5,1)    = -6;
        tk(it+6,1:3)  = [ n5,  n10, n9 ];
        tt(it+6,1)    = 1;

        tk(it+7,1:3)  = [ n11, n10, n8 ];
        tt(it+7,1)    = 5;
        tk(it+8,1:3)  = [ n11, n6,  n8 ];
        tt(it+8,1)    = -3;
        tk(it+9,1:3)  = [ n11, n6,  n7 ];
        tt(it+9,1)    = 4;

        tk(it+10,1:3) = [ n3,  n6,  n7 ];
        tt(it+10,1)   = -1;
        tk(it+11,1:3) = [ n3,  n6,  n4 ];
        tt(it+11,1)   = 6;
        tk(it+12,1:3) = [ n3,  n2,  n4 ];
        tt(it+12,1)    = -2;

      end

      it = it + 12;
           
    end
  end

  return
end

