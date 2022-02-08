function x = cplex_solution_single_read ( data )

%*****************************************************************************80
%
%% cplex_solution_single_read() reads a CPLEX single solution file.
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
%    struct DATA, the solution data structure.
%
%  Output:
%
%    real X(*,1), the single solution vector.
%

%
%  Get the number of solutions.
%
  sol_num = 1;
%
%  CPLEX doesn't tell us the size of the solution vector, so set first
%  dimension to 1.
%
  x = zeros ( 1, 1);
%
%  Determine how many nonzero values are given in this solution.
%
  value_num = length ( data.CPLEXSolution.variables.variable );
%
%  Read the name, index, and value for each nonzero entry.
%
  for value_index = 1 : value_num
    name = data.CPLEXSolution.variables.variable{value_index}.Attributes.name;
    var_index = str2num ( name(2:end) );
    index2 = data.CPLEXSolution.variables.variable{value_index}.Attributes.index;
    index2 = str2num ( index2 );
    value = data.CPLEXSolution.variables.variable{value_index}.Attributes.value;
    value = str2num ( value );
%
%  Save the data into X.
%
    x(var_index,1) = value;

  end

  return
end
