function value = color_rgb ( k )

%*****************************************************************************80
%
%% color_rgb() returns the RGB values for one of several colors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2021
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    integer K: the color index.  K can be a column vector.
%    If K is outside the range, the mod function is
%    used to wrap it into this range.
%
%  Output:
%
%    real VALUE(*,3): the RGB coordinates of the colors indexed by K.
%    These values are triples of real numbers between 0 and 1,
%    suitable for use with MATLAB.
%
  k = mod ( k - 1, 22 ) + 1;

  rgb = [
      0,   0, 128;
      0, 128,   0;
      0, 128, 128;
      0, 130, 200;
     60, 180,  75;
     70, 240, 240;
    128,   0,   0;
    128,   0, 128;
    128, 128,   0;
    128, 128, 128;
    145,  30, 180;
    170, 110,  40;
    170, 255, 195;
    210, 245,  60;
    220, 190, 255;
    230,  25,  75;
    240,  50, 230;
    245, 130,  48;
    250, 190, 212;
    255, 215, 180;
    255, 255,  25;
    255, 255, 200 ] / 255;
%
%  Try to lighten the murky colors.
%
% value = sqrt ( sqrt ( rgb(k,1:3) ) );
  value = sqrt ( rgb(k,1:3) );

  return
end

