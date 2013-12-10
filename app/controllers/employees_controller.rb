class EmployeesController < ApplicationController
  def index
    #inding.pry
    # make your employee objects available to the correlating view here
    @employees = Employee.return_list_of_employees('db/employee_data.csv')

  end
end
