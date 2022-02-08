function solution_tikz_ij ( x, filename, grid_word, tile_num, tile_word, ...
  plot_scale )

%*****************************************************************************80
%
%% solution_tikz_ij() makes a tikz() image of a tiling solution.
%
%  Discussion:
%
%    The solution is assumed to be a binary vector, with a value of 0 or 1
%    for each variable.
%
%    The ij coordinate system is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer X(*), the solution vector.  Each 1 selects a configuration,
%    encoding the rotation, reflection and translation of a tile.
%
%    string FILENAME: the name of the tex file to be created.
%
%    function GRID_WORD: the name of the function that defines the 
%    boundary word for the grid.
%
%    function TILE_NUM: the name of the function that returns the number
%    of tiles.
%
%    function TILE_WORD: the name of the function that returns the
%    boundary word for each tile.
%
%    real PLOT_SCALE: a scale factor for the plot.
%
  node_scale = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'solution_tikz_ij():\n' );
  fprintf ( 1, '  MATLAB/Octave version %s\n', version ( ) );
  fprintf ( 1, '  Make a tikz() image of a tiling solution.\n' ); 

  output_unit = fopen ( filename, 'wt' );
  fprintf ( output_unit, '\\documentclass{article}\n' );
  fprintf ( output_unit, '\\usepackage{tikz}\n' );
  fprintf ( output_unit, '\\begin{document}\n' );
  fprintf ( output_unit, '  \\begin{tikzpicture}\n' );
  fprintf ( output_unit, ...
        ' [scale=%g,draw=black,rounded corners=0.05mm]\n', plot_scale );
%
%  Now go through the motions of generating every possible tile configuration.
%  When you have generated the word corresponding to a tile which is part of
%  the solution, add that to the plot.
%
  color = 0;
%
%  Specify the number of tiles.
%
  tile_count = tile_num ( );
%
%  Define the region R.
%    W_R: boundary word for R.
%    PIJ_R: (I,J) coordinates of 30-degree node of triangle #1 of R.
%
  [ w_r, pij_r ] = grid_word ( );

  eij = word_to_edge_ij ( w_r, pij_r );
  en = size ( eij, 1 );
  fprintf ( output_unit, '    \\draw [ultra thick] ' );
  for ei = 1 : en
    fprintf ( output_unit, '(%d,%d) -- ', eij(ei,1:2 ) );
  end
  fprintf ( output_unit, 'cycle;\n' );
%
%  Analyze the region R.
%    TK_R: for each triangle in R, the indices of the 30, 60, 90 degree nodes.
%    TT_R: for each triangle in R, the triangle type, between -6 and -1, or 1 and 6.
%    WIJ_R: (I,J) coordinates of the nodes of R.
%
  [ tk_r, tt_r, wij_r ] = triangle_k ( w_r, pij_r );

  element_num = size ( tt_r, 1 );
%
%  Allocate arrays:
%    A for the EQN_NUM x VAR_NUM linear system.
%    b for the EQN_NUM right hand side.
%    EQN_NUM = number of regions to cover and number of tiles to use.
%    VAR_NUM has to be determined, by generating all distinct tile configurations.
%
  eqn_num = element_num + tile_count;
  var_num = 0;
  A = zeros ( eqn_num, var_num );
  b = ones ( eqn_num, 1 );
%
%  Loop over tiles.
%
  for s = 1 : tile_count
%
%  Start a constraint row for this tile.
%
    eqn_cons = element_num + s;
%
%  Consider all counterclockwise tile rotations that are multiples of 60 degrees:
%  0, 60, 120, 180, 240, 300:
%
    for r = 0 : 5
%
%  Consider a tile or its reflection.
%
      for reflect = 0 : 1
%
%  Get a fresh copy of the word and base point.
%
        [ w_s, pij_s ] = tile_word ( s );
%
%  Perform R counterclockwise rotations of 60 degrees.
%
        [ w_s, pij_s ] = word_rotate_ij ( w_s, pij_s, r );
%
%  Perform REFLECT reflections across X axis.
%
        if ( reflect == 1 )
          [ w_s, pij_s ] = word_reflect_ij ( w_s, pij_s );
        end
%
%  Get the TYPE of the triangles that are the tile elements.
%    TK_S: for each triangle in S, the indices of the 30, 60, 90 degree nodes.
%    TT_S: for each triangle in S, the triangle type, between -6 and -1, or 1 and 6.
%    WIJ_S: (I,J) coordinates of the nodes of S.
%
        [ tk_s, tt_s, wij_s ] = triangle_k ( w_s, pij_s );
%
%  Get tile (i,j) coordinates of 30 degree node of tile triangle #1.
%
        jack_s = tk_s(1,1);
%
%  Key is the type of element #1.
%  We can only try to place this tile configuration starting at 
%  region elements of the same type as KEY.
%
        key = tt_s(1);
%
%  Consider triangle J in region R.
%
        for j = 1 : element_num
%
%  Does it match the type of triangle #1 of S?
%
          if ( tt_r(j) == key )
%
%  Determine the translation that would map triangle #1 of S to triangle J of R.
%
            jack_r = tk_r(j,1);
            pij_s(1,1:2) = wij_r(jack_r,1:2) - wij_s(jack_s,1:2);
%
%  Does this configuration remain in the region R?
%
            [ inside, element ] = region_contains_tile ( w_r, pij_r, w_s, pij_s );
%
%  The configuration constitutes a new variable.
%  Update the equation of each triangle of R covered by the configuration.
%  Update the constraint equation for the tile.
%
            if ( inside )

              var_num = var_num + 1;

              if ( x(var_num) == 1 )
                fprintf ( 1, '  Tile = %d, VAR = %d,', s, var_num );
                fprintf ( 1, '  Rotate = %d, reflect = %d,', r, reflect );
                fprintf ( 1, '  type = %d  pij = (%d,%d)\n', key, pij_s );

                eij = word_to_edge_ij ( w_s, pij_s );
                en = size ( eij, 1 );
                fprintf ( output_unit, '    \\draw ' );
                for ei = 1 : en
                  fprintf ( output_unit, '(%d,%d) -- ', eij(ei,1:2 ) );
                end
                fprintf ( output_unit, 'cycle;\n' );
                [ xc, yc ] = word_to_centroid_ij ( w_s, pij_s );
%               xc = xc * plot_scale;
%               yc = yc * plot_scale;
                fprintf ( output_unit, ...
                  '    \\node [scale = %g] at (%g,%g) {%d};\n', ...
                  node_scale, xc, yc, s );
              end

            end % end configuration remains in region.

          end % end key match

        end  % end element search

      end  % end reflection check

    end  % end rotation check

  end  % end tile check

  fprintf ( output_unit, '  \\end{tikzpicture}\n' );
  fprintf ( output_unit, '\\end{document}\n' );

  fprintf ( 1, '  tikz image saved as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'solution_tikz_ij():\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
