require 'csv'

class Employee

    TAX_RATE = 0.3

  attr_reader :name, :base_salary
  def initialize(name, base_salary)
    @name = name
    @base_salary = base_salary.to_i
  end

    def self.return_list_of_employees(filename)
    raw_data = File.read(filename)
    raw_data = CSV.parse(raw_data, headers:true)
    @employees = []
    raw_data.each do |row|
      if row['Employee Type'] == 'owner'
        @employees << Owner.new(row['Name'], row['Base Salary'], row['Quota Level'], row['Bonus'])
      elsif row['Employee Type'] == 'developer'
        @employees << Developer.new(row['Name'], row['Base Salary'])
      elsif row['Employee Type'] == 'designer'
        @employees << Designer.new(row['Name'], row['Base Salary'])
      elsif row['Employee Type'] == 'commission'
        @employees << CommissionSalesPerson.new(row['Name'], row['Base Salary'], row['Commission'])
      # elsif row['Employee Type'] == 'quota'
      #   @employees << QuotaSalesPerson.new(row['Name'], row['Base Salary'], row['Quota Level'], row['Bonus'])
      end
    end
    @employees
  end

  def gross_salary
    (@base_salary - (@base_salary * TAX_RATE)).to_i
  end

end
