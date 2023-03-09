class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASS"]
  def show
    @categories = Product.distinct.count("category_id")
    @num_products = Product.distinct.count("id")
  end
end
