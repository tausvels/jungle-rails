class Admin::DashboardController < ApplicationController
  def show
    @total_products=Product.count
    @total_category=Category.count
    @category=Category.order(name: :asc)
  end
end
