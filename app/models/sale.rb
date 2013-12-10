class Sale

  attr_reader :last_name, :amount

  def initialize(last_name, amount)
    @last_name = last_name
    @amount = amount
  end

  def self.monthly_sales(filename)
    sales_data = []
    CSV.foreach(filename, headers:true) do |row|
      sales_data << Sale.new(row[0],row[1])
    end
    sales_data
  end


end
