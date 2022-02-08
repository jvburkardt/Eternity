function eternity_lp ( )

%*****************************************************************************80
%
%% eternity_lp() creates an LP file describing the eternity puzzle.
%
%  Discussion:
%
%    Matlab's sparse storage option is used for the matrix A.
%
%    We are given a region R, and set of tiles S.
%
%    We seek configurations (rotation+reflection+translation) of each
%    tile in S which remain in R.
%
%    Each such configuration is a possible component of a covering.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'eternity_lp():\n' );
  fprintf ( 1, '  Define the eternity puzzle and a set of tiles.\n' );
  fprintf ( 1, '  Set up the linear system A*x=b defining the tiling problem.\n' );
  fprintf ( 1, '  Use sparse storage for the matrix A.\n' );
  fprintf ( 1, '  Write that information to an LP file.\n' );
%
%  Specify the number of tiles.
%
  tile_num = 209;
%
%  Define the region R.
%    W_R: boundary word for R.
%    PIJ_R: (I,J) coordinates of 30-degree node of triangle #1 of R.
%
  [ w_r, pij_r ] = eternity_grid_word ( );
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
  eqn_num = element_num + tile_num;
  nz_num = 0;
%
%  On first pass, determine var_num and nz_num.
%  On second pass, allocate A and assign values to A and b.
%
  for pass = 1 : 2

    if ( pass == 2 )
      A = sparse ( [], [], [], eqn_num, var_num, nz_num );
      b = ones ( eqn_num, 1 );
    end
%
%  Starting pass 2, we need var_num from pass 1 for the "sparse()" command.
%  Then we need to reset it to 0!
%
    var_num = 0;
%
%  Loop over tiles.
%
    for s = 1 : tile_num
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
          [ w_s, pij_s ] = eternity_tile_word ( s );
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
%  Update the equation of each triangle of R that is covered by the configuration.
%  Update the constraint equation for the tile.
%
              if ( inside )

                var_num = var_num + 1;
 
                if ( pass == 2 )
                  for k = 1 : 36
                    eqn_tri = element(k);
                    A(eqn_tri,var_num) = 1;
                    nz_num = nz_num + 1;
                  end
                  A(eqn_cons,var_num) = 1;
                  nz_num = nz_num + 1;
                end

              end % end configuration remains in region.

            end % end key match

          end  % end element search

        end  % end reflection check

      end  % end rotation check

    end  % end tile check

  end % pass 1 and 2
%    
%  Create the LP file describing this linear system.
%
  filename = 'eternity.lp';
  label = '\ eternity LP';
  lp_write ( filename, label, eqn_num, var_num, A, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  eternity system computed.\n' );
  fprintf ( 1, '  matrix A has %d rows, %d columns, %d nonzeros\n', ...
    eqn_num, var_num, nz_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  eternity information saved as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'eternity_lp():\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end     

