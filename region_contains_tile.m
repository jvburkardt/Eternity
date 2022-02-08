function [ inside, element ] = region_contains_tile ( w_r, pr_ij, w_t, pt_ij )

%*****************************************************************************80
%
%% region_contains_tile() reports whether the region contains an oriented tile.
%
%  Discussion:
%
%    The region and the oriented tile can each be regarded as a list of 
%    triangles, identified by (i,j) coordinates.
%
%    The tile, as oriented, fits into the region if every tile triangle
%    appears on the list of region triangles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character W_R, the boundary word for the region.
%
%    integer PR_IJ(1,2), the (i,j) coordinates of the 30 degree node
%    of the first triangle of the region.
%
%    character W_T, the boundary word for the tile.
%
%    integer PT_IJ(1,2), the (i,j) coordinates of the 30 degree node
%    of the first triangle of the tile.
%
%  Output:
%
%    logical INSIDE, is true if the tile is contained in the region.
%
%    integer ELEMENT(): the index of the triangle in R that corresponds
%    to the triangle in T.
%

%
%  Generate triangles of the region.
%
  [ tk_r, tt_r, w2_r ] = triangle_k ( w_r, pr_ij );
%
%  Create array TC_R for region: 
%  row I contains I,J coordinates of 30, 60, 90 nodes for triangle I.
%
  tn_r = size ( tk_r, 1 );
  tc_r = zeros ( tn_r, 6 );
  for i = 1 : tn_r
    k = 0;
    for j = 1 : 3
      node = tk_r(i,j);
      xij = w2_r(node,1);
      k = k + 1;
      tc_r(i,k) = xij;
      yij = w2_r(node,2);
      k = k + 1;
      tc_r(i,k) = yij;      
    end
  end
%
%  Generate triangles of the oriented tile.
%
  [ tk_t, tt_t, w2_t ] = triangle_k ( w_t, pt_ij );
%
%  Create array TC_T for tile: 
%  row I contains I,J coordinates of 30, 60, 90 nodes for triangle I.
%
  tn_t = size ( tk_t, 1 );
  tc_t = zeros ( tn_t, 6 );
  for i = 1 : tn_t
    k = 0;
    for j = 1 : 3
      node = tk_t(i,j);
      if ( node < 0 )
        inside = false;
        element = -1;
        return
      end
      xij = w2_t(node,1);
      k = k + 1;
      tc_t(i,k) = xij;
      yij = w2_t(node,2);
      k = k + 1;
      tc_t(i,k) = yij;      
    end
  end
%
%  Determine if all tile triangles appear on the region triangle list.
%    VALUE(i) is true if TC_T(I,:) appears as a row of TC_R.
%    ELEMENT(I) is the index of the row in TC_R corresponding to TC_T(i,:).
%
  [ value, element ] = ismember ( tc_t, tc_r, 'rows' );

  inside = all ( value );

  return
end     

