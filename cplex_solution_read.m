function x = cplex_solution_read ( filename )

%*****************************************************************************80
%
%% cplex_solution_read() reads a CPLEX solution file.
%
%  Discussion:
%
%    The structure of the CPLEX solution file varies depending on whether
%    CPLEX found just one, or several solutions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2018
%
%  Author:
%
%    John Burkardt
%
%  Input:
%
%    string FILENAME, the name of the file to be read.
%
%  Output:
%
%    real X(*,SOL_NUM), an array of solutions.
%

%
%  Copy the XML data into a MATLAB struct.
%
  data = xml2struct ( filename );
%
%  Determine whether this file contains one, or multiple solutions.
%
  if ( isfield ( data, 'CPLEXSolutions' ) )
    x = cplex_solution_multiple_read ( data );
  else
    x = cplex_solution_single_read ( data );
  end
%
%  In some cases, CPLEX might return a solution X with values -0, or with
%  a tiny nonzero value.  Presumably, these are meaningless, but we must 
%  reset them to 0 (or, in general, integer values) so as not to confuse
%  the plotting code which checks for zero/nonzero values.
%
  x = abs ( x );

  x = round ( x );

  return
end

