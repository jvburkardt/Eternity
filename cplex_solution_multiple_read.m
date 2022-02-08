function x = cplex_solution_multiple_read ( data )

%*****************************************************************************80
%
%% cplex_solution_multiple_read() reads a CPLEX multiple solution file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 June 2018
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
%    real X(*,SOL_NUM), an array of solutions.
%

%
%  Get the number of solutions.
%
  sol_num = length ( data.CPLEXSolutions.CPLEXSolution );
%
%  CPLEX doesn't tell us the size of the solution vectors, so set first
%  dimension to 1.
%
  x = zeros ( 1, sol_num );
%
%  Examine each solution.
%
  for sol_index = 1 : sol_num
%
%  Determine how many nonzero values are given in this solution.
%
    value_num = length ( data.CPLEXSolutions.CPLEXSolution{1,sol_index}.variables.variable );
%
%  Read the name, index, and value for each nonzero entry.
%
    for value_index = 1 : value_num
      name = data.CPLEXSolutions.CPLEXSolution{1,sol_index}.variables.variable{value_index}.Attributes.name;
      var_index = str2num ( name(2:end) );
      index2 = data.CPLEXSolutions.CPLEXSolution{1,sol_index}.variables.variable{value_index}.Attributes.index;
      index2 = str2num ( index2 );
      value = data.CPLEXSolutions.CPLEXSolution{1,sol_index}.variables.variable{value_index}.Attributes.value;
      value = str2num ( value );
%
%  Save the data into X.
%
      x(var_index,sol_index) = value;

    end

  end
%
%  If the number of solutions was greater than 1, then the first solution
%  is redundant, since CPLEX lists the "best" solution first, then all the
%  solutions.
%
  if ( 1 < sol_num )
    x = x(:,2:sol_num);
    sol_num = sol_num - 1;
  end

  return
end
