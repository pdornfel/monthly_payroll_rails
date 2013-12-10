class SalesController < ApplicationController
  def index
    # make your sales objects available to the correlating view here
    @sales = Sale.monthly_sales('db/sales_data.csv')
  end
end
