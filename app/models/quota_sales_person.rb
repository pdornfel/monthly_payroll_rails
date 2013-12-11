class QuotaSalesPerson < Employee
  attr_reader :quota, :bonus

  def initialize(name, base_salary, quota, bonus)
    super(name, base_salary)
    @quota = quota
    @bonus = bonus.to_i
  end

  def bonus
    data = Sale.monthly_sales('db/sales_data.csv')
    sales = 0
    data.each do |sale|
      sales += sale.amount.to_i if sale.last_name == @name.split(' ')[1]
    end
    if sales > @quota.to_i
      @bonus
    else
      0
    end
  end

  def monthly_pay
    data = gross_salary + bonus
    data / 12
  end

  def total_sales_dollars
    data = Sale.monthly_sales('db/sales_data.csv')
    sales = 0
    data.each do |sale|
      if sale.last_name == @name.split(' ')[1]
        sales += sale.amount.to_i
      end
    end
    sales
  end

  def commission_dollars
    bonus
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

end


