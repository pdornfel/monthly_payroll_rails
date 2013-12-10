class Developer < Employee

  def initialize(name, base_salary)
    super(name, base_salary)
  end

  def monthly_pay
    (gross_salary / 12).to_i
  end

end