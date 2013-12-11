class CommissionSalesPerson < Employee
  attr_reader :commission
  def initialize(name, base_salary, commission)
    super(name, base_salary)
    @commission = commission.to_f
  end

  def commission_sales
    data = Sale.monthly_sales('db/sales_data.csv')
    sales = []
    data.each do |sale|
      if sale.last_name == @name.split(' ')[1]
        sales << sale
      end
    end
    sales
  end

  def total_sales_dollars
    sales = 0
    commission_sales.each do |sale|
      sales += sale.amount.to_i
    end
    sales
  end

  def monthly_pay
    data = (gross_salary).to_i
    data / 12
  end

  def commission_dollars
    (total_sales_dollars * @commission).round(0)
  end

end