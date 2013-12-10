class CommissionSalesPerson < Employee
  attr_reader :commission
  def initialize(name, base_salary, commission)
    super(name, base_salary)
    @commission = commission
    @sales = []
  end

  def commission_sales
    data = Sale.monthly_sales('db/sales_data.csv')
    sales = []
    data.each do |sale|
      if sale.last_name == @name.split(' ')[1]
        @sales << sale
      end
    end
    @sales
  end

  def monthly_pay
    data = (gross_salary).to_i
    data / 12
  end

end



# Ricky Bobby - CommissionSalesPerson
# Gross Salary: $28000
# Commision met: ((((puts yesss or nooo)
# Commission: $1.5
# base salary: $40000
# monthly pay: $2333