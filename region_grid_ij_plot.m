function region_grid_ij_plot ( w, p_ij )

%*****************************************************************************80
%
%% region_grid_ij_plot() displays the triangles composing a region.
%
%  Discussion:
%
%    The (i,j) coordinate system is used.
%
%    The calling program is responsible for 
%    issuing any preliminary "figure()" command if desired; 
%    calling additional plot functions to modify the image;
%    calling plot adjustment commands to label, rescale, or save the image.
%
%    In particular, once the region is plotted, "tile_overlay_plot" 
%    can be called to fill in some of the triangles, indicating how a 
%    particular tile has been placed in the region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    character W, the boundary word for the region.
%
%    integer P_IJ(1,2), the (i,j) coordinates of the 30 degree node
%    of the first triangle of the region.
%
%  Local:
%
%    integer TK(TKN,3), the indices of the nodes forming triangles of the region.
%
%    integer TT(TKN), the type of each triangle.
%
%    integer W_IJ(WN,2), the (i,j) coordinates of the nodes.
%
  node_number = false;
%
%  Index the nodes in the region
%  and index the nodes forming triangle in the region.
%
  [ tk, tt, w_ij ] = triangle_k ( w, p_ij );

  tkn = size ( tk, 1 );

  hold ( 'on' );

  for tki = 1 : tkn

    a = tk(tki,1);
    b = tk(tki,2);
    c = tk(tki,3);

    x = [ w_ij(a,1), w_ij(b,1), w_ij(c,1) ];
    y = [ w_ij(a,2), w_ij(b,2), w_ij(c,2) ];
    rgb = color_rgb ( tt(tki) );
    fill ( x, y, [1.0,1.0,0.95], 'edgecolor', 'k' );

    if ( node_number )
      xc = ( w_ij(a,1) + w_ij(b,1) + w_ij(c,1) ) / 3.0;
      yc = ( w_ij(a,2) + w_ij(b,2) + w_ij(c,2) ) / 3.0;
      lc = sprintf ( '%d', tki );
      text ( xc, yc, lc, 'HorizontalAlignment', 'Center' );
    end

  end

  hold ( 'off' );

  return
end     

