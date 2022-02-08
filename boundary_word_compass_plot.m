function boundary_word_compass_plot ( )

%*****************************************************************************80
%
%% boundary_word_compass_plot() displays the compass used for boundary words.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2021
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'boundary_word_compass_plot\n' );
%
%  S contains the boundary word symbols.
%
  s = 'ABbCDdEFfGHhIJjKLl';
%
%  D1 is the angle in degrees for the symbol.
%  D2 is the angle in degrees for the vector.
%  J and j are set to 271 degrees to obviate a mistake in plot_arrow.
%
  d1 = [   0,  30,  40,  60,  90, 100, ...
         120, 150, 140, 180, 210, 200, ...
         240, 271, 260, 300, 330, 320 ];

  d2 = [   0,  30,  30,  60,  90,  90, ...
         120, 150, 150, 180, 210, 210, ...
         240, 271, 271, 300, 330, 330 ];
%
%  E is the length of each vector.
%
  a = 0.5;
  b = sqrt ( 3.0 ) / 3.0;
  c = sqrt ( 3.0 ) / 6.0;
  e = [ a, b, c, a, b, c, a, b, c, a, b, c, a, b, c, a, b, c ];
%
%  Tabulate the data.
%
  for i = 1 : 18
    fprintf ( 1, '  %s  %3d  %5.3f\n', s(i), d1(i), e(i) );
  end
%
%  Draw the compass.
%
  figure ( 1 );
  clf ( );

  hold ( 'on' );

  x0 = 0.0;
  y0 = 0.0;
  text ( x0, y0, '0', 'HorizontalAlignment', 'Center' );
  for i = 1 : 18

    xti = 1.1 * e(i) * cos ( d1(i) * pi / 180.0 );
    yti = 1.1 * e(i) * sin ( d1(i) * pi / 180.0 );
    text ( xti, yti, s(i), 'HorizontalAlignment', 'Center' );

    xai = e(i) * cos ( d2(i) * pi / 180.0 );
    yai = e(i) * sin ( d2(i) * pi / 180.0 );
    arrow_plot ( x0, y0, xai, yai );

  end

  hold ( 'off' )

  grid ( 'on' );
  axis ( 'equal' )
  axis ( 'square' )
  axis ( [ -0.8, +0.8, -0.8, +0.8 ] )

  filename = 'boundary_word_compass.png';
  print ( '-dpng', filename );
  fprintf ( 1, '  Graphics saved as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'boundary_word_compass_plot\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

