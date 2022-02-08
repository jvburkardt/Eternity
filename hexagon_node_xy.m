function u = hexagon_node_xy ( )

%*****************************************************************************80
%
%% hexagon_node_xy() returns the nodes of a hexagon object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2020
%
%  Author:
%
%    John Burkardt
%
%  Output:
%
%    real U(25,2): the (x,y) coordinates of the nodes.
%
  s2 = sqrt ( 3.0 ) / 2.0;
  s3 = sqrt ( 3.0 ) / 3.0;
  s4 = sqrt ( 3.0 ) / 4.0;
  s6 = sqrt ( 3.0 ) / 6.0;

  u = ...
  [ ...
      1.0,   0.0;  ... % A
      0.75,  s4;   ... % B
      0.5,   s2;   ... % C
      0.0,   s2;   ... % D
     -0.5,   s2;   ... % E
     -0.75,  s4;   ... % F
     -1.0,   0.0;  ... % G
     -0.75, -s4;   ... % H
     -0.5,  -s2;   ... % I
      0.0,  -s2;   ... % J
      0.5,  -s2;   ... % K 
      0.75, -s4;   ... % L
%
      0.5,   0.0;  ... % M
      0.5,   s6;   ... % N
      0.25,  s4;   ... % O
      0.0,   s3;   ... % P
     -0.25,  s4;   ... % Q
     -0.5,   s6;   ... % R
     -0.5,   0.0;  ... % S
     -0.5,  -s6;   ... % T
     -0.25, -s4;   ... % U
      0.0,  -s3;   ... % V
      0.25, -s4;   ... % W 
      0.5,  -s6;   ... % X
%
      0.0,   0.0  ... % Z
  ];

  return
end

