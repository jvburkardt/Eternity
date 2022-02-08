function region_grid_ij_tikz ( w, p_ij, output_unit, show_boundary, ...
  show_triangles, label_triangles, plot_scale )

%*****************************************************************************80
%
%% region_grid_ij_tikz() displays elemental triangles composing a region.
%
%  Discussion:
%
%    The image is created using Tikz, and is generally processed in a 
%    Tex or Latex file.
%
%    The (i,j) coordinate system is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2021
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
%    integer output_unit: the output unit to which the Tikz information is written.
%
%    logical show_boundary: True if the boundary of the region should be displayed.
%
%    logical show_triangles: True if the boundary of every elemental triangle
%    should be displayed.
%
%    logical label_triangles: True if each elemental triangle should be labeled.
%
%    real plot_scale: a scale factor for the plot.
%
%  Local:
%
%    integer TK(TKN,3), the indices of the nodes forming triangles of the region.
%
%    integer TT(TKN), the type of each triangle.
%
%    integer W_IJ(WN,2), the (i,j) coordinates of the nodes.
%
  node_scale = 1.0;

  fprintf ( output_unit, '\\documentclass{article}\n' );
  fprintf ( output_unit, '\\usepackage{tikz}\n' );
  fprintf ( output_unit, '\\begin{document}\n' );
  fprintf ( output_unit, '  \\begin{tikzpicture}\n' );
  fprintf ( output_unit, ...
        ' [scale=%g,draw=black,rounded corners=0.05mm]\n', plot_scale );

  if ( show_boundary )
    eij = word_to_edge_ij ( w, p_ij );
    en = size ( eij, 1 );
    fprintf ( output_unit, '    \\draw [ultra thick] ' );
    for ei = 1 : en
      fprintf ( output_unit, '(%g,%g) -- ', eij(ei,1:2 ) );
    end
    fprintf ( output_unit, 'cycle;\n' );
  end
%
%  Index the nodes in the region
%  and index the nodes forming triangle in the region.
%
  if ( show_triangles )

    [ tk, tt, w_ij ] = triangle_k ( w, p_ij );

    tkn = size ( tk, 1 );

    for tki = 1 : tkn

      a = tk(tki,1);
      b = tk(tki,2);
      c = tk(tki,3);

      fprintf ( output_unit, ...
        '    \\draw (%g,%g) -- (%g,%g) -- (%g,%g) -- cycle;\n', ...
        w_ij(a,1), w_ij(a,2), ...
        w_ij(b,1), w_ij(b,2), ...
        w_ij(c,1), w_ij(c,2) );

      if ( label_triangles )
        xc = ( w_ij(a,1) + w_ij(b,1) + w_ij(c,1) ) / 3.0;
        yc = ( w_ij(a,2) + w_ij(b,2) + w_ij(c,2) ) / 3.0;
%       xc = plot_scale * xc;
%       yc = plot_scale * yc;
        lc = sprintf ( '%d', tki );
        fprintf ( output_unit, ...
          '    \\node [scale = %g] at (%g,%g) {%d};\n', ...
          node_scale, xc, yc, tki );
      end

    end

  end

  fprintf ( output_unit, '  \\end{tikzpicture}\n' );
  fprintf ( output_unit, '\\end{document}\n' );

  return
end     

